with max_measurement as (
    
    select year_id, measurement,
        respondent_id,
        round(max("value"),2) as max_value
    from SurveyData
    group by year_id, measurement
    having "value" = max("value")

),

-- mean_measurement as (
--     select year_id, measurement,
--         round(mean("value"),2) as mean_value
--     from SurveyData
--     group by year_id, measurement
-- )

max_resp_info as (
    select survey_type, contact_info, 
        measurement, year_id, max_value
    from max_measurement
    join (
        select respondent_id, contact_info,
            survey_type
        from {{ ref('joined_data')}}
    ) as sp
    on sp.respondent_id = max_measurement.respondent_id
)

select *
from max_resp_info
