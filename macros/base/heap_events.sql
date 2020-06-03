{% macro heap_events() %}

    {{ adapter_macro('heap.heap_events') }}

{% endmacro %}


{% macro default__heap_events() %}

select 
    
    *,
    {{heap.time_field('event_time')}}
    
from {{ source('heap', 'all_events') }}
qualify ROW_NUMBER() over (partition by event_id order by time) = 1

{% endmacro %}