select max_value
from {{ref('max_summary')}}
where max_value > 300 or max_value < (
    select max(avg_val)
    from {{ref('group_summaries')}}
)