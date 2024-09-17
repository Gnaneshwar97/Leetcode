# Write your MySQL query statement below
with base as 
(select *, case when activity_type = "start" then -1*timestamp 
             when activity_type = "end" then 1*timestamp end as timestamp_new 
from Activity 
), 

inter as (
select machine_id, process_id , sum(timestamp_new) as total
from base 
group by 1,2
)

select machine_id, round(avg(total),3) as processing_time 
from inter 
group by 1