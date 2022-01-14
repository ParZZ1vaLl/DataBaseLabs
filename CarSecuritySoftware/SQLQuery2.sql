-- 1) Обрати повні імена водіїв, чиє прізвище містить літеру і, віком до 30 років.

select CONCAT(DriversWithI.name , ' ', DriversWithI.surname) as FullDriverName
from (select * from Drivers where surname like '%i%') DriversWithI
where DriversWithI.age<30;

-- 2) Обрати статуси списання вантажного транспорту, тип яких Tipper. Виводити номер транспорту, статус та тип.

select ft.freight_transport_id, (select tot.type_name from TypesOfTransports tot where tot.type_id=ft.type_id) as Type,
(select written_off from Statuses s where s.status_id=ft.status_id) as Written_off
from FreightTransports ft
where ft.type_id = (select type_id from TypesOfTransports where type_name = 'Tipper')

-- 3) Вивести членів Бригад, при цьому виводити назву бригади та повне ім’я водія, що в ній працює.
select (select brigade_name from Brigades b where b.brigade_id=bm.brigade_id) as Brigade, 
(select CONCAT(name, ' ', surname) from Drivers d where d.driver_id = bm.driver_id) as FullName
from BrigadeMembers bm

-- 4) Обрати інформацію про маршрути, шо не використовуються автобусами.

select *
from Paths p
where p.path_id not in (select pt.path_id from PassengerTransports pt 
where pt.type_id in (select tot.type_id from TypesOfTransports tot where tot.type_name like '%bus%'));

-- 5) Обрати інформацію про вантажний транспорт, який було продано або виставлено на продаж.

select * 
from FreightTransports ft
where ft.status_id in (select status_id from Statuses where for_sale=1 or sold=1);

-- 6) Обрати водіїв, що працюють в бригадах, якщо ім’я бригади містить літеру n у назві.

select *
from Drivers d
where exists (select bm.driver_id from BrigadeMembers bm 
			  where bm.driver_id=d.driver_id and bm.brigade_id in (select brigade_id from Brigades where brigade_name like '%n%'));

-- 7) Обрати водіїв, які не закріплені за бригадою.

select *
from Drivers d
where not exists (select bm.driver_id from BrigadeMembers bm where bm.driver_id=d.driver_id);

-- 8) Обрати всі можливі комбінації бригад з водіями для водіїв з фамілією Гончаров. (Виводити повне ім’я водія та назву бригади)

select CONCAT(d.name, ' ', d.surname) as FullDriverName, b.brigade_name
from Drivers d cross join Brigades b
where d.surname = 'Goncharov';
-- Без обмеження вибірки на фамілію, запит виводить 60 рядків (маємо 12 водіїв та 5 бригад).

-- 9) Вивести таблицю пасажирських перевезень, із вказанням назви типу транспорту замість його айди, дистанцією шляху замість його номеру та вказати значення поля written_off для кожного рядка.

select pt.passenger_transport_id, pt.mark, pt.age, pt.passenger_capacity, 
p.distance as path_length, tot.type_name as type, pt.status_id, s.written_off
from PassengerTransports pt, Paths p, TypesOfTransports tot, Statuses s
where pt.path_id=p.path_id and pt.type_id=tot.type_id and pt.status_id=s.status_id;

-- 10) Додати в попередній запит умову: не виводити інформацію для типу транспорту интерсіті.

select pt.passenger_transport_id, pt.mark, pt.age, pt.passenger_capacity, 
p.distance as path_length, tot.type_name as type, pt.status_id, s.written_off
from PassengerTransports pt, Paths p, TypesOfTransports tot, Statuses s
where pt.path_id=p.path_id and pt.type_id=tot.type_id and pt.status_id=s.status_id and tot.type_name <> 'Intercity';

-- 11) Умова з запиту 9.

select pt.passenger_transport_id, pt.mark, pt.age, pt.passenger_capacity, 
p.distance as path_length, tot.type_name as type, pt.status_id, s.written_off
from PassengerTransports pt inner join Paths p on pt.path_id=p.path_id inner join TypesOfTransports tot on pt.type_id=tot.type_id inner join Statuses s on pt.status_id=s.status_id;

-- 12) Вивести всіх водіїв, які містяться в бригадах.

select bm.brigade_id, d.*
from BrigadeMembers bm left join Drivers d on bm.driver_id=d.driver_id;

-- 13) Запит 12, переписаний через праве з'єднання.

select bm.brigade_id, d.*
from Drivers d right join BrigadeMembers bm on d.driver_id=bm.driver_id;

-- 14) Дізнатись до якої бригади належить кожен з водіїв.

select *
from Drivers d full outer join BrigadeMembers bm on d.driver_id=bm.driver_id;

-- 15) Дізнатись який пасажирський транспорт використовує шлях (для кожного шляху).

select p.path_id, pt.passenger_transport_id
from Paths p full outer join PassengerTransports pt on p.path_id=pt.path_id;

