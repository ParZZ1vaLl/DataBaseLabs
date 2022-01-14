Use CarSecuritySoftware

INSERT INTO Brigades (brigade_name, brigadier_id) 
VALUES ('Titanium', 132), ('Kreg', 155), ('Voland', 137), ('Klin', 114), ('Nimb', 95);

INSERT INTO Drivers (name, surname, age, employment_date) 
VALUES ('Glen', 'Prihodko', 29, '2020.01.12'), ('Oleg', 'Goncharov', 35, '2021.03.01'),
('Vasyl', 'Golova', 24, '2019.11.21'), ('Artem', 'Goncharov', 41, '2021.03.01'),
('Oleg', 'Vasilenko', 59, '2017.05.11'), ('Alex', 'Vyiko', 22, '2020.12.08'),
('Andrey', 'Litvin', 27, '2019.10.16'), ('Oleg', 'Gricak', 60, '2016.05.21'),
('Anna', 'Vlasenkova', 30, '2020.11.18'), ('Dmytro', 'Holik', 23, '2021.02.21'),
('Habib', 'Nurzamat', 55, '2019.12.19'), ('Nikolay', 'Kalchenko', 26, '2020.10.17');

INSERT INTO BrigadeMembers VALUES (1,1), (1,5), (1,7), (5,11), (5,12), (4,3), (4,2), (1,10),(2,4), (2,6), (3,9);

INSERT INTO TypesOfTransports (type_name, driver_id) 
VALUES ('Bus',11), ('Trolley', 11), ('Taxi', 1), ('Taxi', 2), ('Minibus', 12), ('Intercity',9), ('Van',3), ('Mini Van', 4), ('Tipper', 6);


INSERT INTO States VALUES (11,1), (12,5), (3,4), (4,8), (9,6);

INSERT INTO Statuses (written_off, for_sale, sold) VALUES
(0,0,0),(0,1,0),(0,0,1), (1,1,0), (1,0,0),(1,0,1);


INSERT INTO Paths (distance, passenger_nub) VALUES 
(10000,5), (25000, 30), (3000000, 90), (85000,50), (50000,2), (65000,10), (550000,35);

INSERT INTO PassengerTransports (mark, age, passenger_capacity, status_id, type_id, path_id) VALUES
('VolgaBus', 20, 35, 1, 1, 7), ('Scania', 56, 35, 6, 1, 2), ('Volvo', 56, 90, 1, 6, 3);

INSERT INTO FreightTransports (mark, age, load_capacity, status_id, type_id) VALUES
('FX',10, 4000,1,9), ('Tiger',5, 2500,2,8), ('Volvo',25, 4200,1,7), ('Volvo',10, 3000,5,8);
