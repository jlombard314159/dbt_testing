select respondent_id, x_coord, y_coord,
    year_id
from {{ ref('height_data')}}
where x_coord < 0 or y_coord > 0