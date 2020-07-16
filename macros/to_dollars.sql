{% macro to_dollars(column_name, precision=0) -%}
  round({{ column_name }} / 100, {{ precision }})
{%- endmacro %}