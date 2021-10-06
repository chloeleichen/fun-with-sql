with table1 as
(select *, row_number() over (order by lat_n) as rnum from station)
select lat_n,  rnum
from table1
where rnum 
between 
  (select case 
   		  when max(rnum1)%2  = 0 then max(rnum1)/2 
   		  else (max(rnum1)/2)+1
   		  end
   from (select rnum as rnum1 from table1) t1) 
and 
  (select (max(rnum2)/2)+1 from (select rnum as rnum2 from table1) t2);

with table1 as
(select *, row_number() over (order by lat_n) as rnum from station)
select * from table1