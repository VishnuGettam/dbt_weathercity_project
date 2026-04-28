{{
    config(alias='tbltripfacts_stg')
}}



with trip_rides as 
(
select  
ride_id,
rideable_type,
date(to_timestamp(started_at)) as trip_date,
start_station_id as start_station_id,
end_station_id  as end_station_id,
member_casual as member_casual,
timestampdiff("second",to_timestamp(started_at),to_timestamp(ended_at)) as trip_duration_seconds 
from  {{ source('weathercity_stage','tblcitybikes_stg') }}
limit 500 
)
select * from trip_rides
