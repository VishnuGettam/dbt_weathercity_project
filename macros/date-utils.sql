
{# macro function to define the season of the date based on the month of the date #}

{% macro getseason(x)  %}


case when to_timestamp( {{  x }}  ) is not null  then
    case when month(to_timestamp( {{ x }} )) in (12,1,2) then 'WINTER'     
         when month(to_timestamp( {{ x }} )) in (3,4,5) then 'SPRING'     
         when month(to_timestamp( {{ x }} )) in (6,7,8) then 'SUMMER'
    else 'AUTUMN'
    end 
else null
end


{% endmacro %}



{# macro function to define the daytpe of the date whether its a business day or a weekend day #}

{%macro daytype(x) %}

case when to_timestamp({{ x }}) is not null then
    case when dayname(to_timestamp({{ x }})) in ('Sun', 'Sat') then 'WEEKEND'
         else 'BUSINESSDAY'
    end
else null
end

{% endmacro %}