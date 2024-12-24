with base as 
(
select tiv_2015
from insurance 
group by tiv_2015 
having count(*) > 1
),

base2 as (
select lat, lon, concat(lat,lon) as comb
from insurance 
group by comb
having count(*) = 1
),
base3 as (
select * from insurance where concat(lat,lon) in (select comb from base2 )
),

 base4 as (
select * from insurance where tiv_2015 in (select * from base)
 )

select round(sum(base4.tiv_2016),2) as tiv_2016 from base4 
join base3 on base4.pid = base3.pid

-- select * from insurance where tiv_2015 in (select tiv_2015 from base)
