{{
    config(alias = 'tbldailyweather_dimension_stg')
}}



with daily_weather_cte as 
(
    select 
    date(time) as weather_date,
    weather ,
    temp,
    pressure,
    humidity,
    clouds
    from  {{ source('weathercity_stage','tblweather_stg')}} 
),
weather_agg as
(
    select 
    date(time) as weather_date,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidy,
    round(avg(clouds),2) as avg_clouds
    from  {{ source('weathercity_stage','tblweather_stg')}}  
    group by date(time),weather 
    qualify row_number() over (partition by  weather_date order by count(weather) desc) = 1
)
select  *
from weather_agg
