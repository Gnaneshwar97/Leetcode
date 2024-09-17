# Write your MySQL query statement below
select *
from (select case when temperature - (lag(temperature) over (order by recordDate)) > 0 and 
                        datediff(recordDate, (lag(recordDate) over (order by recordDate))) = 1 then id end as id 
from Weather) b
where b.id is not null 