with group_summ as (
    select year_id, survey_type, measurement,
    round(avg("value"),2) as avg_val,
    count(*) as count,
    concat(round(max("value"),2), "-",
           round(min("value"),2)) as "range"
    from {{ ref('joined_data')}}
    group by year_id, survey_type, measurement
)

select *
from group_summ

