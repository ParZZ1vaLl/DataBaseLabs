-- 1) �������� �������������, ����� ������ ��� � �������� �������;

CREATE VIEW "WorkingFreightTransport" AS
select ft.freight_transport_id, ft.mark, ft.age, ft.load_capacity, tot.type_name, s.for_sale
from FreightTransports ft inner join Statuses s on ft.status_id=s.status_id inner join TypesOfTransports tot on ft.type_id=tot.type_id
where s.written_off = 0 and s.sold = 0;
select * from WorkingFreightTransport;

-- 2) �������� �������������, ����� ������ ��� � �������� ������� �� ���������, ����� �������� � �.a;

create view WorkingFreightTransportVan AS
select *
from WorkingFreightTransport
where type_name like '%van%';

select * from WorkingFreightTransportVan;

-- 3) ������������ ����� � ������������� ������� ALTER VIEW;

alter view WorkingFreightTransportVan as
select *
from WorkingFreightTransport
where type_name = 'Van';

select * from WorkingFreightTransportVan;

-- 4) �������� ���������� ���������� ��� �� ������������� � ������������� ���������� �������� (��������� � MsSQL sp_help, sp_helptexst � sp_depends)

sp_help 'WorkingFreightTransportVan';
