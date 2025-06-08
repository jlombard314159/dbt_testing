select avg_val
from {{ref('group_summaries')}}
where avg_val > 220 or avg_val < 180
