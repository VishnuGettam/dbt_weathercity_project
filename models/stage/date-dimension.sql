{{
    config(
        alias = 'tblDate_Dimension_stg',
    )
}}

with date_dimension as 
(
     select     
    to_timestamp(started_at) as started_at,
    date(to_timestamp(started_at)) as  date_started_at, 
    hour(to_timestamp(started_at)) as hour_started_at,
    dayofmonth(to_timestamp(started_at)) as month_started_at, 
    {{ getseason('started_at') }} as season_started_at,
    upper(cast(dayname(to_timestamp(started_at)) as string)) as dayname_started_at, 
    {{ daytype('started_at') }} as daytype_started_at    

    from {{ source('weathercity_stage', 'tblcitybikes_stg') }} limit 500
)
select 
*
from date_dimension