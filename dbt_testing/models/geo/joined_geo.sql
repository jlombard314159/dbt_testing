--- Note that this is ephemeral and we are not storing this in the DB
with geo_parent as (
    select ParentData.respondent_id, ParentData.contact_info,
        ParentData.survey_type, 
        geo.spatial_id, 
        geo.x_coord,
        geo.y_coord
    from ParentData
    left join (
        select respondent_id, spatial_id,
            x_coord, y_coord
        from GeographicData
    ) as geo
    on ParentData.respondent_id = geo.respondent_id
)

select *
from geo_parent