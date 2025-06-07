with height_data as (
    select *
    from {{ ref('max_measurements')}}
    where measurement = 'height'
)

select * from height_data