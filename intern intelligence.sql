-- 1.Tabel
select * from  traffic_accidents;

-- 2.Percentage of crashes
select alignment ,count(*)*100.0 / (select count(*) from traffic_accidents) as percentage
from traffic_accidents
group by alignment;

-- 3.Highest light condition for crash
select lighting_condition, count(*) from traffic_accidents 
group by lighting_condition
order by count(*) desc;

-- 4.Top 5 Crashes due to way type
select trafficway_type , count(*)* 100.0 / (select count(*) from traffic_accidents)as Percentage
from traffic_accidents
group by trafficway_type
order by trafficway_type desc
limit 5;

-- 5.Alignment type have more than 250 crashes
select alignment , count(*) as Crash_Count from traffic_accidents
group by alignment
having count(*)>250;

-- 6.Lowest crash type
select first_crash_type, count(*) as Crashes 
from traffic_accidents
group by first_crash_type
order by first_crash_type asc
limit 1;

-- 7.No. of crashes by month
select distinct crash_type,Count(*)as Crashes , crash_month 
from traffic_accidents
group by crash_type, crash_month
order by crash_month desc;

-- 8.Percentage of damage 
select damage, count(*) * 100.0/ (select count(*) from traffic_accidents) as Percentage
from traffic_accidents
group by damage
order by damage desc;

-- 9.Count of severe injuries
select most_severe_injury, count(most_severe_injury) as Count
from traffic_accidents
group by most_severe_injury;

-- 10.Safest surface for ride
select roadway_surface_cond, count(*) 
from traffic_accidents
group by roadway_surface_cond
order by roadway_surface_cond desc
limit 1;
 
