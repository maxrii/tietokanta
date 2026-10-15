CREATE DATABASE IF NOT EXISTS kampiakseli;
USE kampiakseli;

CREATE TABLE CUSTOMER (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE VEHICLE (
    VehicleID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    RegistrationNumber VARCHAR(20) NOT NULL,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    YearModel INT,
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
        ON DELETE CASCADE
);

CREATE TABLE APPOINTMENT (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT NOT NULL,
    VehicleID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    ServiceType VARCHAR(100),
    Status VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
        ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES VEHICLE(VehicleID)
        ON DELETE CASCADE
);

CREATE TABLE EMPLOYEE (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(50),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE SERVICE (
    ServiceID INT AUTO_INCREMENT PRIMARY KEY,
    AppointmentID INT NOT NULL,
    VehicleID INT NOT NULL,
    EmployeeID INT NOT NULL,
    ServiceDate DATE NOT NULL,
    Description VARCHAR(255),
    Cost DECIMAL(10,2),
    FOREIGN KEY (AppointmentID) REFERENCES APPOINTMENT(AppointmentID)
        ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES VEHICLE(VehicleID)
        ON DELETE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
        ON DELETE CASCADE
);
INSERT INTO CUSTOMER (FirstName, LastName, PhoneNumber, Email)
VALUES
('Mikko', 'Nieminen', '0400342912', 'mikko.n.nieminen@gmail.com'),
('Matti', 'Virtanen', '0501246928', 'mattivirtanen@gmail.com'),
('Kasper', 'Keskinen', '0400970453', 'kasperk@outlook.com'),
('Kalle', 'Jokinen', '0453782653', 'kalle.joki@yahoo.fi');

INSERT INTO VEHICLE (CustomerID, RegistrationNumber, Brand, Model, YearModel)
VALUES
(3, 'DHG-493', 'Volvo', 'V50', 2007),
(2, 'KEO-928', 'Audi', 'A3', 2019),
(4, 'JEM-143', 'Tesla', 'Model 3', 2021),
(1, 'EFV-382', 'Ford', 'Focus', 2020);

INSERT INTO APPOINTMENT (CustomerID, VehicleID, AppointmentDate, AppointmentTime, ServiceType, Status)
VALUES
(3, 1, '2026-10-20', '14:00', 'MA-HUOLTO', 'EI ALOI.'),
(2, 2, '2026-10-30', '09:30', 'RENKAIDEN VAIHTO', 'EI ALOI.'),
(3, 4, '2026-11-23', '11:30', 'MAALAUS', 'EI ALOI.'),
(4, 1, '2026-10-10', '10:30', 'VIKA-ARVIO', 'VALMIS');

INSERT INTO EMPLOYEE (FirstName, LastName, JobTitle, PhoneNumber)
VALUES
('Eero', 'Niemi', 'Mekaanikko', '0450291746'),
('Ville', 'Suomi', 'Työnjohtaja', '0403627514'),
('Olli', 'Koski', 'Mekaanikko', '0503672984'),
('Eemil', 'Nestori', 'Mekaanikko', '0450294728');

INSERT INTO SERVICE (AppointmentID, VehicleID, EmployeeID, ServiceDate, Description, Cost)
VALUES
(4, 1, 2, '2026-10-10', 'VIKA-ARVIO', 250.00),
(3, 4, 3, '2026-11-23', 'MAALAUS', 1000.00),
(2, 2, 1, '2026-10-30', 'RENKAIDEN VAIHTO', 75.00),
(1, 1, 4, '2026-10-20', 'MA-HUOLTO', 450.00);


