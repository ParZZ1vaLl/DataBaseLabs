Use CarSecuritySoftware

CREATE TABLE Paths (
path_id INT IDENTITY (1,1) PRIMARY KEY,
distance INT NOT NULL,
passenger_nub INT NOT NULL
);


CREATE TABLE PassengerTransports (
passenger_transport_id INT IDENTITY (1,1) PRIMARY KEY,
mark NVARCHAR(50) NOT NULL,
age INT NOT NULL,
passenger_capacity INT NOT NULL,
status_id INT NULL,
type_id INT NOT NULL,
path_id INT NOT NULL
);


CREATE TABLE Statuses (
status_id INT IDENTITY (1,1) PRIMARY KEY,
written_off BIT NOT NULL,
for_sale BIT NOT NULL,
sold BIT NOT NULL
);


CREATE TABLE FreightTransports (
freight_transport_id INT IDENTITY (1,1) PRIMARY KEY,
mark NVARCHAR(50) NOT NULL,
age INT NOT NULL,
load_capacity INT NOT NULL,
status_id INT NULL,
type_id INT NOT NULL
);


CREATE TABLE TypesOfTransports (
type_id INT IDENTITY (1,1) PRIMARY KEY,
type_name NVARCHAR(20) NOT NULL,
driver_id INT NOT NULL,
CONSTRAINT UQ_driver_type UNIQUE (type_name,driver_id)
);


CREATE TABLE States (
driver_id INT NOT NULL,
type_id INT NOT NULL,
CONSTRAINT PK_States PRIMARY KEY (type_id, driver_id)
);


CREATE TABLE Drivers (
driver_id INT IDENTITY (1,1) PRIMARY KEY,
name NVARCHAR(50) NOT NULL,
surname NVARCHAR(50) NOT NULL,
age INT NOT NULL,
employment_date DATE NOT NULL
);


CREATE TABLE BrigadeMembers (
brigade_id INT NOT NULL,
driver_id INT NOT NULL,
CONSTRAINT PK_BrigadeMembers PRIMARY KEY (brigade_id, driver_id)
);


CREATE TABLE Brigades (
brigade_id INT IDENTITY (1,1) PRIMARY KEY,
brigade_name NVARCHAR(50) NOT NULL,
brigadier_id INT NOT NULL
);

ALTER TABLE PassengerTransports ADD CONSTRAINT FK_PassengerPaths FOREIGN KEY (path_id) REFERENCES Paths (path_id),
CONSTRAINT FK_PassengerType FOREIGN KEY (type_id) REFERENCES TypesOfTransports (type_id),
CONSTRAINT FK_PassengerStatus FOREIGN KEY (status_id) REFERENCES Statuses (status_id),
CONSTRAINT CH_Capacity CHECK (passenger_capacity BETWEEN 2 AND 100);


ALTER TABLE Paths ADD CONSTRAINT CH_Distance CHECK (distance > 3000);


ALTER TABLE Statuses ADD CONSTRAINT DF_WrittenOff DEFAULT 0 FOR written_off,
CONSTRAINT DF_ForSale DEFAULT 0 FOR for_sale,
CONSTRAINT DF_Sold DEFAULT 0 FOR sold;


ALTER TABLE FreightTransports ADD CONSTRAINT FK_FreightType FOREIGN KEY (type_id) REFERENCES TypesOfTransports (type_id),
CONSTRAINT FK_FreightStatus FOREIGN KEY (status_id) REFERENCES Statuses (status_id),
CONSTRAINT CH_LoadCapacity CHECK (load_capacity < 4500);


ALTER TABLE Drivers ADD CONSTRAINT CH_Age CHECK (age BETWEEN 22 AND 60);


ALTER TABLE States ADD CONSTRAINT FK_StateDriver FOREIGN KEY (driver_id) REFERENCES Drivers (driver_id),
CONSTRAINT FK_StateType FOREIGN KEY (type_id) REFERENCES TypesOfTransports (type_id);


ALTER TABLE BrigadeMembers ADD CONSTRAINT FK_MemberDriver FOREIGN KEY (driver_id) REFERENCES Drivers (driver_id),
CONSTRAINT FK_MemberBrigade FOREIGN KEY (brigade_id) REFERENCES Brigades (brigade_id); 

ALTER TABLE Drivers ADD CONSTRAINT CH_Date CHECK (employment_date <= GETDATE());

