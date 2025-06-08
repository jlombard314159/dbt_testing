select count
from {{ref('group_summaries')}}
where count > 10000 or count < 5000