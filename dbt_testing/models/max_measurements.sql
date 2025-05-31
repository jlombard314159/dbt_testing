with max_record as (

    select respondent_id,
        year_id,
        measurement,
        max(value) as max_value
    from SurveyData
    group by respondent_id, measurement

),

geo_first_id as (
    select *
    from GeographicData
    where spatial_id = '1'
),

max_geo as (
    
    select max_record.respondent_id, year_id,
        measurement, max_value,
        x_coord, y_coord
    from max_record
    left join geo_first_id on
        max_record.respondent_id = geo_first_id.respondent_id
)

select *
from max_geo
where year_id = 1

