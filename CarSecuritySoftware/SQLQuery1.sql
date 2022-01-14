-- 1) ������ �������, ��� �� ���� ���������������� ��䳿�, ����������� ��������� � ������ ���.

select name, surname, employment_date
from Drivers
order by employment_date desc;

-- 2) ������ ���������� ��� ��䳿�, ��� ���� � ����.

select *
from Drivers
where name = 'Oleg';

-- 3) ������ ������������ ��������� ����-��� �����, ���� Volvo.

select * 
from PassengerTransports
where mark <> 'Volvo';

-- 4) ������ ������ ���������� ����������, �� ����� �� �������� 10 ����, �������� ������� �������� 3���� (3000) �� ����� �� Tiger.

select freight_transport_id as IdOfNewPowerfulCars
from FreightTransports
where age <= 10 and load_capacity>3000 and mark <> 'Tiger';

-- 5) ������ �����, ��������� ���� ����� 40000 ��� ������� �������� �������� 40.

select path_id as EffectivePaths
from Paths
where distance > 40000 or passenger_nub > 40;

-- 6) ������ ���������� ��� �������, �� ����� �� Titanium.

select *
from Brigades
where not(brigade_name = 'Titanium');


-- 7) ������� ���� ����������, �� �� � Mini Van ��� Taxi �� ��������� ������ ���� �� ��������� ��䳿 �� ������� 1 �� 12.

select type_name, driver_id
from TypesOfTransports
where NOT((type_name = 'Taxi' or type_name = 'Mini Van') and (driver_id = 1 or driver_id = 12))

-- 8) ������� �������, � ���� ������ �������, ��� ���������� �� ������, �� �����, �� ���� ���� �� �������. 

select * 
from Statuses
where (for_sale=1 or sold=1) and written_off=0;

-- 9) ������� ������� �� ��'� ���� �� ����� ��'�, � ���� ��� ������� �� ��������, ��� ��䳿� ��� �� ����� 40 ����.

select CONCAT(name, ' ', surname, ' ') AS FullName, age, employment_date
from Drivers
where age > 40


-- 10) 

select TOT.* 
from TypesOfTransports as TOT
where TOT.type_name = 'Bus' or TOT.type_name = 'Minibus'

-- 11) ������ ��䳿�, �� ����� ����, �����, ������ �� �����, � �� ������� 35, 50, 23, 27 �� 60.

select *
from Drivers
where name in ('Oleg','Artem','Andrey','Dmytro') and age in (35,50,23,27,60);

-- 12) ������ ��������� ���������, �� ����� ������ � ������� �� 1 �� 15 ����.

select *
from FreightTransports
where age between 1 and 15;

-- 13) ������ ������ ������������� ����������, ������ ���� ������.

select passenger_transport_id
from PassengerTransports
where status_id is not null;


-- 14) ������ ���� ����������, �� ������ � ���� van ��� bus.

select * 
from TypesOfTransports
where type_name like '%van%' or type_name like '%bus%';

-- 15) ������ ��䳿�, �� ������� ����� ����� ����� � ������� a-h, ����� ����� l, m �� n, � ������� ����� ����-��� ���� v.

select * 
from Drivers
where surname like '[a-h]_[l-n]%[^v]'