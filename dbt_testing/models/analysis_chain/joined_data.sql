--- Note that this is ephemeral and we are not storing this in the DB
with survey_parent as (
    select ParentData.respondent_id, ParentData.contact_info,
        ParentData.survey_type, 
        sd.year_id, 
        sd.measurement,
        sd."value"
    from ParentData
    left join (
        select respondent_id, year_id,
            measurement, "value"
        from SurveyData
    ) as sd
    on ParentData.respondent_id = sd.respondent_id
)

select *
from survey_parent