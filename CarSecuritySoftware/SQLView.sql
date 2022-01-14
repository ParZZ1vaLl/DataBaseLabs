-- 1) створити представлення, котре містить дані з декількох таблиць;

CREATE VIEW "WorkingFreightTransport" AS
select ft.freight_transport_id, ft.mark, ft.age, ft.load_capacity, tot.type_name, s.for_sale
from FreightTransports ft inner join Statuses s on ft.status_id=s.status_id inner join TypesOfTransports tot on ft.type_id=tot.type_id
where s.written_off = 0 and s.sold = 0;
select * from WorkingFreightTransport;

-- 2) створити представлення, котре містить дані з декількох таблиць та посилання, котре створене в п.a;

create view WorkingFreightTransportVan AS
select *
from WorkingFreightTransport
where type_name like '%van%';

select * from WorkingFreightTransportVan;

-- 3) модифікувати запит з використанням команди ALTER VIEW;

alter view WorkingFreightTransportVan as
select *
from WorkingFreightTransport
where type_name = 'Van';

select * from WorkingFreightTransportVan;

-- 4) отримати довідникову інформацію про ці представлення з використанням вбудованих процедур (наприклад в MsSQL sp_help, sp_helptexst и sp_depends)

sp_help 'WorkingFreightTransportVan';
