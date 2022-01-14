-- 1) ������ ���� ����� ��䳿�, �� ������� ������ ����� �, ���� �� 30 ����.

select CONCAT(DriversWithI.name , ' ', DriversWithI.surname) as FullDriverName
from (select * from Drivers where surname like '%i%') DriversWithI
where DriversWithI.age<30;

-- 2) ������ ������� �������� ���������� ����������, ��� ���� Tipper. �������� ����� ����������, ������ �� ���.

select ft.freight_transport_id, (select tot.type_name from TypesOfTransports tot where tot.type_id=ft.type_id) as Type,
(select written_off from Statuses s where s.status_id=ft.status_id) as Written_off
from FreightTransports ft
where ft.type_id = (select type_id from TypesOfTransports where type_name = 'Tipper')

-- 3) ������� ����� ������, ��� ����� �������� ����� ������� �� ����� ��� ����, �� � �� ������.
select (select brigade_name from Brigades b where b.brigade_id=bm.brigade_id) as Brigade, 
(select CONCAT(name, ' ', surname) from Drivers d where d.driver_id = bm.driver_id) as FullName
from BrigadeMembers bm

-- 4) ������ ���������� ��� ��������, �� �� ���������������� ����������.

select *
from Paths p
where p.path_id not in (select pt.path_id from PassengerTransports pt 
where pt.type_id in (select tot.type_id from TypesOfTransports tot where tot.type_name like '%bus%'));

-- 5) ������ ���������� ��� ��������� ���������, ���� ���� ������� ��� ���������� �� ������.

select * 
from FreightTransports ft
where ft.status_id in (select status_id from Statuses where for_sale=1 or sold=1);

-- 6) ������ ��䳿�, �� �������� � ��������, ���� ��� ������� ������ ����� n � ����.

select *
from Drivers d
where exists (select bm.driver_id from BrigadeMembers bm 
			  where bm.driver_id=d.driver_id and bm.brigade_id in (select brigade_id from Brigades where brigade_name like '%n%'));

-- 7) ������ ��䳿�, �� �� �������� �� ��������.

select *
from Drivers d
where not exists (select bm.driver_id from BrigadeMembers bm where bm.driver_id=d.driver_id);

-- 8) ������ �� ������ ��������� ������ � ������ ��� ��䳿� � ���볺� ��������. (�������� ����� ��� ���� �� ����� �������)

select CONCAT(d.name, ' ', d.surname) as FullDriverName, b.brigade_name
from Drivers d cross join Brigades b
where d.surname = 'Goncharov';
-- ��� ��������� ������ �� �����, ����� �������� 60 ����� (���� 12 ��䳿� �� 5 ������).

-- 9) ������� ������� ������������ ����������, �� ��������� ����� ���� ���������� ������ ���� ����, ���������� ����� ������ ���� ������ �� ������� �������� ���� written_off ��� ������� �����.

select pt.passenger_transport_id, pt.mark, pt.age, pt.passenger_capacity, 
p.distance as path_length, tot.type_name as type, pt.status_id, s.written_off
from PassengerTransports pt, Paths p, TypesOfTransports tot, Statuses s
where pt.path_id=p.path_id and pt.type_id=tot.type_id and pt.status_id=s.status_id;

-- 10) ������ � ��������� ����� �����: �� �������� ���������� ��� ���� ���������� �������.

select pt.passenger_transport_id, pt.mark, pt.age, pt.passenger_capacity, 
p.distance as path_length, tot.type_name as type, pt.status_id, s.written_off
from PassengerTransports pt, Paths p, TypesOfTransports tot, Statuses s
where pt.path_id=p.path_id and pt.type_id=tot.type_id and pt.status_id=s.status_id and tot.type_name <> 'Intercity';

-- 11) ����� � ������ 9.

select pt.passenger_transport_id, pt.mark, pt.age, pt.passenger_capacity, 
p.distance as path_length, tot.type_name as type, pt.status_id, s.written_off
from PassengerTransports pt inner join Paths p on pt.path_id=p.path_id inner join TypesOfTransports tot on pt.type_id=tot.type_id inner join Statuses s on pt.status_id=s.status_id;

-- 12) ������� ��� ��䳿�, �� �������� � ��������.

select bm.brigade_id, d.*
from BrigadeMembers bm left join Drivers d on bm.driver_id=d.driver_id;

-- 13) ����� 12, ����������� ����� ����� �'�������.

select bm.brigade_id, d.*
from Drivers d right join BrigadeMembers bm on d.driver_id=bm.driver_id;

-- 14) ĳ������� �� ��� ������� �������� ����� � ��䳿�.

select *
from Drivers d full outer join BrigadeMembers bm on d.driver_id=bm.driver_id;

-- 15) ĳ������� ���� ������������ ��������� ����������� ���� (��� ������� �����).

select p.path_id, pt.passenger_transport_id
from Paths p full outer join PassengerTransports pt on p.path_id=pt.path_id;

