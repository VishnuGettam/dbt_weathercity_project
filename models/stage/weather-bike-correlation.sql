{{
    config(
        materialized='table',
        alias = 'tblweatherbikes_correlation'
    )
}}


With trips_fact as
(
    select * from {{ ref('trip-facts') }}
),
daily_weather as
(
    select * from {{ ref('daily-weather') }}
)
select 
dwd.*,
tf.*
from trips_fact tf
left join daily_weather dwd
on tf.trip_date = dwd.weather_date and dwd.weather_date is not null