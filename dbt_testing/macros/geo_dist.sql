{% macro geo_dist(coord_one, coord_two) %}

({{coord_one}} - {{coord_two}}) * ({{coord_one}} - {{coord_two}})

{% endmacro %}