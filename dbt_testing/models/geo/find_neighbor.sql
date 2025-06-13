--- For a given respondent_id find the closest neighbor

with max_geo as (

    select geo.respondent_id, 
        geo.x_coord, geo.y_coord,
        geo.contact_info, measurement, year_id,
        max_value
    from {{ ref('max_summary')}}
    as summ
    left join (
        select *
        from {{ ref('joined_geo')}}
        where spatial_id = 1
    ) as geo
    on summ.survey_type = geo.survey_type and 
        summ.respondent_id = geo.respondent_id
),

neighbor_join as (

    select * 
    from max_geo
    cross join (
        select x_coord as geo_x_coord,
            y_coord as geo_y_coord,
            contact_info as neighbor_contact_info
        from {{ref('joined_geo')}}
        where spatial_id = 1 and
            respondent_id not in (
                select distinct(respondent_id)
                from max_geo
            )
    )
),

near_neighbor as (

    select respondent_id,
        contact_info, measurement, year_id,
        max_value, neighbor_contact_info,
    min(sqrt({{geo_dist('x_coord', 'geo_x_coord')}} + 
                    {{geo_dist('y_coord', 'geo_y_coord')}})) as distance
    from neighbor_join
    group by respondent_id
    

)

select * from near_neighbor