-- 1) запит з використанням функції COUNT;

select b.brigade_name, count(bm.brigade_id) as BrigadeMembersQuantity
from Brigades b inner join BrigadeMembers bm on b.brigade_id = bm.brigade_id
group by b.brigade_name;

-- 2) запит з використанням функції SUM;

select sum(p.distance) as FullDistance
from PassengerTransports pt inner join Paths p on pt.path_id = p.path_id;

-- 3) запит з використанням функцій UPPER, LOWER;

select upper (CONCAT(name, ' ', surname)) as FullName, age
from Drivers 
where driver_id in (5,6,7,8,9);

select lower (CONCAT(name, ' ', surname)) as FullName, age
from Drivers 
where driver_id in (5,6,7,8,9);

-- 4) запит з використанням функцій для роботи з датами;

select (CONCAT(name, ' ', surname)) as FullName, employment_date
from Drivers
where Year(employment_date) < 2020 and Month(employment_date) < 10 and Day(employment_date) between 1 and 15;

-- 5) запит з використанням групування по одному стовпцю;

select year(employment_date) as EmploymentYear, count(*) as EmployeesQuantity
from Drivers
group by year(employment_date);

-- 6) запит з використанням групування по декільком стовпцям;

select bm.brigade_id, year(d.employment_date) as EmploymentYear, max(d.age) as EmployeesQuantity
from Drivers d inner join BrigadeMembers bm on d.driver_id=bm.driver_id
group by year(d.employment_date), bm.brigade_id;

-- 7) запит з використанням умови відбору груп HAVING;

select bm.brigade_id, avg(d.age) as EmployeesAvgAge
from Drivers d inner join BrigadeMembers bm on d.driver_id=bm.driver_id
group by bm.brigade_id
having count(bm.driver_id)>1;

-- 8) запит з використанням HAVING без GROUP BY;
select min(distance) as SmallestPathLength
from Paths
having avg(passenger_nub)>20;


-- 9) запит з використанням сортування по стовпцю.

select name, surname, employment_date
from Drivers
order by employment_date desc, name asc, surname asc;