-- 1) Обрати прізвища, ім’я та дату працевлаштування водіїв, відсортувати починаючи з пізніших дат.

select name, surname, employment_date
from Drivers
order by employment_date desc;

-- 2) Обрати інформацію про водіїв, ім’я яких – Олег.

select *
from Drivers
where name = 'Oleg';

-- 3) Обрати пасажирський транспорт будь-якої марки, окрім Volvo.

select * 
from PassengerTransports
where mark <> 'Volvo';

-- 4) Обрати номери вантажного транспорту, вік якого не перевищує 10 років, вантажна здібність перевищує 3тони (3000) та марка не Tiger.

select freight_transport_id as IdOfNewPowerfulCars
from FreightTransports
where age <= 10 and load_capacity>3000 and mark <> 'Tiger';

-- 5) Обрати шляхи, дистанція яких більше 40000 або кількість пасажирів перевищує 40.

select path_id as EffectivePaths
from Paths
where distance > 40000 or passenger_nub > 40;

-- 6) Обрати інформацію про бригади, чиї назви не Titanium.

select *
from Brigades
where not(brigade_name = 'Titanium');


-- 7) Вибрати типи транспортів, що не є Mini Van або Taxi та основними водіями яких не являються водії під номером 1 та 12.

select type_name, driver_id
from TypesOfTransports
where NOT((type_name = 'Taxi' or type_name = 'Mini Van') and (driver_id = 1 or driver_id = 12))

-- 8) Вибрати статуси, в яких машину продано, або виставлено на продаж, за умови, що вона була не списана. 

select * 
from Statuses
where (for_sale=1 or sold=1) and written_off=0;

-- 9) Вивести прізвище та ім'я водія як повне ім'я, а інші дані вивести як звичайно, для водіїв чий вік більше 40 років.

select CONCAT(name, ' ', surname, ' ') AS FullName, age, employment_date
from Drivers
where age > 40


-- 10) 

select TOT.* 
from TypesOfTransports as TOT
where TOT.type_name = 'Bus' or TOT.type_name = 'Minibus'

-- 11) Обрати водіїв, чиї імена Олег, Артем, Дмитро та Андрій, а вік дорівнює 35, 50, 23, 27 чи 60.

select *
from Drivers
where name in ('Oleg','Artem','Andrey','Dmytro') and age in (35,50,23,27,60);

-- 12) Обрати вантажний транспорт, вік якого лежить в діапазоні від 1 до 15 років.

select *
from FreightTransports
where age between 1 and 15;

-- 13) Обрати номера пасажирського транспорту, статус яких відомий.

select passenger_transport_id
from PassengerTransports
where status_id is not null;


-- 14) Обрати типи транспорту, що містять в назві van або bus.

select * 
from TypesOfTransports
where type_name like '%van%' or type_name like '%bus%';

-- 15) Обрати водіїв, чиї прізвища мають перші літери в діапазоні a-h, третя літера l, m чи n, а остання літера будь-яка окрім v.

select * 
from Drivers
where surname like '[a-h]_[l-n]%[^v]'