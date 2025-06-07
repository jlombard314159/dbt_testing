with survey_parent as (
    select respondent_id, contact_info,
        survey_type
    from ParentData
    left join (
        select respondent_id, year_id,
            measurement, "value"
        from SurveyData
    ) as sd
    on ParentData.respondent_id = SurveyData.respondent_id
)

select *
from survey_parent