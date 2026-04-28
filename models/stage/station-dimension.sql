{{
    config(alias = 'tblstation_dimension_stg')
}}



 with station_dimension as 
(
    select     
    distinct
    start_station_id as station_id,
    start_station_name as station_name,
    start_lat as station_lat,
    start_lng as station_lng 
    from   {{ source('weathercity_stage','tblcitybikes_stg')}} 
    where ride_id !='ride_id' limit 500
)
select * from station_dimension