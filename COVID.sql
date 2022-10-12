CREATE TABLE Vaccine( 
    VaccineID INT NOT NULL PRIMARY KEY, 
    VaccineName VARCHAR(20) NOT NULL 
);
CREATE TABLE Stock(
    VaccineID INT NOT NULL, 
    StockQuantity INT NOT NULL, 
    FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID),
    CONSTRAINT StockConstraint CHECK (StockQuantity>=0)
);
CREATE TABLE Supplier( 
    SupplierID INT NOT NULL PRIMARY KEY, 
    SupplierName VARCHAR(20) NOT NULL, 
    SupplierNumber CHAR(11) NOT NULL, 
    SupplierEmail VARCHAR(50) NOT NULL 
);
CREATE TABLE Orders( 
    OrderID INT NOT NULL PRIMARY KEY, 
    SupplierID INT NOT NULL, 
    OrderDate DATE NOT NULL, 
    BatchNumber INT NOT NULL, 
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) 
);
CREATE TABLE OrderVaccine( 
    OrderID INT NOT NULL, 
    VaccineID INT NOT NULL, 
    OrderQuantity INT NOT NULL, 
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
    FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID) 
);
CREATE TABLE Staff( 
    StaffID INT NOT NULL PRIMARY KEY, 
    StaffName VARCHAR(20) NOT NULL, 
    StaffRole VARCHAR(15) NOT NULL, 
    StaffAddress VARCHAR(50) NOT NULL, 
    StaffPostcode VARCHAR(8) NOT NULL, 
    StaffNumber CHAR(11) NOT NULL, 
    StaffEmail VARCHAR(50) NOT NULL 
);
CREATE TABLE Patient( 
    PatientID INT NOT NULL PRIMARY KEY, 
    FirstName VARCHAR(20), 
    LastName VARCHAR(20), 
    PatientDOB DATE, 
    PatientAge INT, 
    PatientGender CHAR(1), 
    PatientAddress VARCHAR(50), 
    PatientPostcode VARCHAR(8), 
    PatientPhoneNumber VARCHAR(11), 
    PatientEmail VARCHAR(50), 
    Vaccinated CHAR(1), 
    VaccineID INT NOT NULL, 
    VaccineDose INT, 
    NHSNumber INT, 
    FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID),
    CONSTRAINT GenderConstraint CHECK (PatientGender = 'M' OR PatientGender = 'F'),
    CONSTRAINT NameConstraint CHECK (FirstName NOT LIKE '^-?[0-9]+(\.[0-9]+)?$' AND LastName NOT LIKE '^-?[0-9]+(\.[0-9]+)?$'),
    CONSTRAINT EmailConstraint CHECK (PatientEmail LIKE '%@%')
);
CREATE TABLE VaccinatedPatient( 
    PatientID INT NOT NULL PRIMARY KEY, 
    FirstName VARCHAR(20), 
    LastName VARCHAR(20), 
    PatientDOB DATE, 
    PatientAge INT, 
    PatientGender CHAR(1), 
    PatientAddress VARCHAR(50), 
    PatientPostcode VARCHAR(8), 
    PatientPhoneNumber VARCHAR(11), 
    PatientEmail VARCHAR(50), 
    Vaccinated CHAR(1), 
    VaccineID INT NOT NULL, 
    VaccineDose INT, 
    NHSNumber INT, 
    FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID) 
);
CREATE TABLE Appointment( 
    AppointmentID INT NOT NULL PRIMARY KEY, 
    PatientID INT NOT NULL, 
    StaffID INT NOT NULL, 
    AppointmentDateTime DATE,
    BookedDate DATE DEFAULT SYSDATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);
CREATE TABLE Price( 
    SupplierID INT NOT NULL, 
    VaccineID INT NOT NULL, 
    Price Number(4,2) NOT NULL, 
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID), 
    FOREIGN KEY (VaccineID) REFERENCES Vaccine(VaccineID) 
);

INSERT INTO Vaccine VALUES (1,'Oxford/AstraZeneca');
INSERT INTO Vaccine VALUES (2,'Pfizer/BioNTech');
INSERT INTO Vaccine VALUES (3,'Moderna');
INSERT INTO Vaccine VALUES (4,'Janssen');
INSERT INTO Stock VALUES (1,2000);
INSERT INTO Stock VALUES (2,1000);
INSERT INTO Stock VALUES (3,1000);
INSERT INTO Stock VALUES (4,250);
INSERT INTO Supplier VALUES (1,'FAC','02082761573','contact@fac.com');
INSERT INTO Supplier VALUES (2,'SAK','02087638936','info@sak.com');
INSERT INTO Supplier VALUES (3,'BAL','02065455087','admin@bal.com');
INSERT INTO Supplier VALUES (4,'HNBL','02044467282','contact@hnbl.com');
INSERT INTO Orders VALUES (1,4,'09/NOV/2021',1636);
INSERT INTO Orders VALUES (2,3,'11/NOV/2021',2452);
INSERT INTO Orders VALUES (3,1,'12/NOV/2021',3843);
INSERT INTO Orders VALUES (4,2,'14/NOV/2021',4247);
INSERT INTO Orders VALUES (5,4,'15/NOV/2021',6335);
INSERT INTO Orders VALUES (6,2,'18/NOV/2021',2953);
INSERT INTO Orders VALUES (7,2,'20/NOV/2021',5925);
INSERT INTO Orders VALUES (8,1,'21/NOV/2021',2073);
INSERT INTO Orders VALUES (9,3,'22/NOV/2021',3829);
INSERT INTO Orders VALUES (10,4,'22/NOV/2021',0146);
INSERT INTO Orders VALUES (11,1,'24/NOV/2021',3963);
INSERT INTO Orders VALUES (12,2,'25/NOV/2021',7549);
INSERT INTO Orders VALUES (13,1,'26/NOV/2021',5392);
INSERT INTO Orders VALUES (14,4,'27/NOV/2021',2692);
INSERT INTO Orders VALUES (15,3,'29/NOV/2021',2860);
INSERT INTO OrderVaccine VALUES (1,4,500);
INSERT INTO OrderVaccine VALUES (2,3,250);
INSERT INTO OrderVaccine VALUES (3,1,300);
INSERT INTO OrderVaccine VALUES (3,2,750);
INSERT INTO OrderVaccine VALUES (4,4,500);
INSERT INTO OrderVaccine VALUES (5,2,100);
INSERT INTO OrderVaccine VALUES (6,2,200);
INSERT INTO OrderVaccine VALUES (7,1,250);
INSERT INTO OrderVaccine VALUES (7,3,750);
INSERT INTO OrderVaccine VALUES (7,4,600);
INSERT INTO OrderVaccine VALUES (8,1,200);
INSERT INTO OrderVaccine VALUES (9,2,150);
INSERT INTO OrderVaccine VALUES (10,1,100);
INSERT INTO OrderVaccine VALUES (11,4,100);
INSERT INTO OrderVaccine VALUES (12,3,750);
INSERT INTO OrderVaccine VALUES (12,1,150);
INSERT INTO OrderVaccine VALUES (13,2,200);
INSERT INTO OrderVaccine VALUES (13,1,250);
INSERT INTO OrderVaccine VALUES (14,4,500);
INSERT INTO OrderVaccine VALUES (15,3,725);
INSERT INTO OrderVaccine VALUES (15,3,750);
INSERT INTO OrderVaccine VALUES (15,1,650);
INSERT INTO Staff VALUES (1,'Imran Hussain','Doctor','46 Bigman Road','E16 6SD','07252625424','imranhuss@gmail.com');
INSERT INTO Staff VALUES (2,'Hussain Miah','Nurse','36 Longman Road','E16 1GE','07789265424','huss@gmail.com');
INSERT INTO Staff VALUES (3,'Mo Ali','Doctor','29 Smallman Road','E17 4AD','07765492424','moali@gmail.com');
INSERT INTO Staff VALUES (4,'James Aldi','Nurse','22 Health Road','E13 8SD','07890765424','james@gmail.com');
INSERT INTO Staff VALUES (5,'Karmim Joe','Admin','1 Shortman Road','E16 9ND','07829726254','karmim@gmail.com');
INSERT INTO Staff VALUES (6,'Tom Ali','Admin','58 Tallman Road','E19 4NW','07252885424','tomalis@gmail.com');
INSERT INTO Staff VALUES (7,'Katie Perry','Nurse','94 Uni Road','E16 3UD','07287655424','katie@gmail.com');
INSERT INTO Staff VALUES (8,'Imran Miah','Doctor','11 Bigman Avenue','E16 5NS','07298765424','imran@gmail.com');
INSERT INTO Staff VALUES (9,'Smithson Lidl','Doctor','77 Kings Road','NJ4 1LW','07261527281','lidl@gmail.com');
INSERT INTO Staff VALUES (10,'Tiny Temper','Doctor','33 Queens Road','WL3 5DM','07252685424','tinyt@gmail.com');
INSERT INTO PATIENT VALUES(1, 'Jack', 'Smith', '01/NOV/1980', 41, 'M', '14 High Street', 'E11 4WH', '07394785974', 'jack@gmail.com', 'Y', 1, 2, 7483958693);
INSERT INTO PATIENT VALUES(2, 'George', 'Taylor ', '09/OCT/1989', 32, 'M', '64 Station Road', 'E12 5AA', '07483920375', 'gtaylor@gmail.com', 'N', 1, 1, 2983746597);
INSERT INTO PATIENT VALUES(3, 'Jacob', 'Brown ', '01/DEC/1973', 48, 'M', '85 Main Street', 'E12 5AB', '07394576932', 'jacobb@gmail.com', 'N', 2, 1, 2739839384);
INSERT INTO PATIENT VALUES(4, 'Noah', 'Martin ', '20/FEB/1990', 31, 'M', '42 Park Road', 'E12 5AD', '07329574832', 'martin_noah@gmail.com', 'Y', 3, 2, 9383473893);
INSERT INTO PATIENT VALUES(5, 'Charlie', 'Davies ', '27/JAN/2003', 18, 'M', '95 Church Road', 'E16 3AR', '07576973623', 'chalie01@gmail.com', 'Y', 4, 2, 3902483957);
INSERT INTO PATIENT VALUES(6, 'Emily', 'Evans ', '11/MAR/2004', 17, 'F', '26 Victoria Road', 'E18 2GB', '07693840582', 'emilyevans@gmail.com', 'N', 3, 1, 4384592037);
INSERT INTO PATIENT VALUES(7, 'Jessica', 'King ', '21/OCT/1980', 41, 'F', '75 Agate Close', 'E12 3WE', '07384622382', 'jessicaking21@gmail.com', 'N', 2, 1, 3847593057);
INSERT INTO PATIENT VALUES(8, 'Ella', 'Baker ', '16/OCT/1972', 49, 'F', '86 Alestan Beck Road', 'E16 5NU', '07432856984', 'ellabaker@gmail.com', 'Y', 1, 2, 3849548596);
INSERT INTO PATIENT VALUES(9, 'James', 'Green', '29/SEP/1969', 52, 'M', '28 Allhallows Road', 'L1 8JQ', '07823549635', 'jamesgreen@gmail.com', 'Y', 1, 2, 6943325875);
INSERT INTO PATIENT VALUES(10, 'Sophia', 'Edwards ', '12/DEC/2004', 17, 'F', '94 Alnwick Road', 'GU16 7HF', '07438493406', 'edwardssop@gmail.com', 'N', 4, 1, 9433495735);
INSERT INTO PATIENT VALUES(11, 'William', 'Roberts ', '21/NOV/1995', 26, 'M', '27 Andover Avenue', 'E14 UR2', '07320596837', 'williamroberts@gmail.com', 'Y', 3, 2, 3948539401);
INSERT INTO PATIENT VALUES(12, 'Griffith', 'Lewis', '09/APR/1998', 23, 'M', '63 Argyle Road', 'E16 2GH', '07483296748', 'lewis@gmail.com', 'N', 2, 1, 1375930485);
INSERT INTO PATIENT VALUES(13, 'Blanche', 'Collins ', '03/MAY/1990', 31,'F', '73 Atkinson Road', 'E18 4DH', '07213478946', 'collinsbla@gmail.com', 'N', 1, 1, 9475837216);
INSERT INTO PATIENT VALUES(14, 'Tobiah', 'Allen ', '04/JUL/1990', 31, 'M', '37 Baxter Road', 'E13 4TH', '07239674869', 'tobiahallenn@gmail.com', 'Y', 4, 2, 9374763849);
INSERT INTO PATIENT VALUES(15,'Oscar' , 'Burton', '22/OCT/1995', 26, 'M', '3 King George Avenue', 'E12 4EA', '07382738495', 'oscar@gmail.com', 'P', 3, 0, 2363845738);
INSERT INTO PATIENT VALUES(16,'Alastair' , 'Harris', '02/DEC/2004', 17, 'M', '9 Linton Gardens', 'E13 YR3', '07234803943', 'harrisala@gmail.com' ,'N', 2, 1, 8374659127);
INSERT INTO PATIENT VALUES(17,'Archie' , 'Robinson', '12/JUN/1969', 52, 'M', '11 Mortlake Road', 'E16 4TR', '07384839482', 'archie@gmail.com','P' , 1, 0, 2738475930);
INSERT INTO PATIENT VALUES(18,'Felix' , 'Holmes', '01/OCT/1972',49, 'M', '23 Royal Albert Way', 'E16 3TH', '07382947584', 'felicholmes@gmail.com', 'Y', 3, 2, 7625344789);
INSERT INTO PATIENT VALUES(19,'Henry' , 'Kennedy', '05/DEC/1980', 41, 'M', '12 Teal Road ', 'E15 3RE', '07389584932', 'henrykennedy@gmail.com' , 'N', 1, 1, 8475839475);
INSERT INTO PATIENT VALUES(20,'Ava' , 'Granger', '01/OCT/2004', 17, 'F','4 Royal Road', 'E12 4TN', '07483927483', 'avagranger@gmail.com', 'P', 4, 0, 7584938495);
INSERT INTO PATIENT VALUES(21,'Mia' , 'Elffire', '27/JAN/2003', 18, 'F', '8 Pintail Close', 'E16 6TF', '07384958372', 'elffiremiaa@gmail.com', 'Y', 1, 2, 7463847586);
INSERT INTO PATIENT VALUES(22,'Gemma' , 'Dalton', '09/JUL/1990', 31, 'F', '5 Newham Way', 'E11 R3G', '07485738273', 'gemma_dalton@gmail.com', 'N', 2, 1, 7364518293);
INSERT INTO PATIENT VALUES(23,'Nicola' , 'Carmichael', '15/OCT/1989', 32, 'F', '9 Monarch Drive', 'E13 4TR', '07293749537','nicolacar@gmail.com', 'Y', 3, 2, 3749304857);
INSERT INTO PATIENT VALUES(24,'Freya' , 'Everly', '07/DEC/1980', 41, 'F', '11 Macgregor Road', 'E11 4RD', '07837485938','everlyfreya@gmail.com' ,'P', 2, 0, 8374837464);
INSERT INTO PATIENT VALUES(25,'Isla' , 'Elton', '04/MAY/1992', 29, 'F', '2 Opal Close', 'E14 3TG', '07384983274','islaelton@gmail.com','Y', 2, 2, 9384756352);
INSERT INTO Appointment VALUES(1,1,2,TO_DATE('05/JUL/2021 01:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/JUL/2021');
INSERT INTO Appointment VALUES(2,1,2,TO_DATE('05/SEP/2021 01:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/SEP/2021');
INSERT INTO Appointment VALUES(3,2,2,TO_DATE('01/SEP/2021 04:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '25/AUG/2021');
INSERT INTO Appointment VALUES(4,2,2,TO_DATE('01/NOV/2021 04:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '28/OCT/2021');
INSERT INTO Appointment VALUES(5,3,4,TO_DATE('03/DEC/2021 09:15 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/DEC/2021');
INSERT INTO Appointment VALUES(6,3,4,TO_DATE('03/FEB/2022 09:15 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '25/DEC/2021');
INSERT INTO Appointment VALUES(7,4,4,TO_DATE('11/JUN/2020 10:00 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '02/JUN/2020');
INSERT INTO Appointment VALUES(8,5,5,TO_DATE('20/NOV/2020 10:30 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '10/NOV/2020');
INSERT INTO Appointment VALUES(9,5,5,TO_DATE('20/JAN/2021 10:30 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '15/JAN/2021');
INSERT INTO Appointment VALUES(10,6,7,TO_DATE('06/OCT/2021 12:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'),'01/OCT/2021');
INSERT INTO Appointment VALUES(11,6,7,TO_DATE('06/DEC/2021 12:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'),'01/DEC/2021');
INSERT INTO Appointment VALUES(12,7,8,TO_DATE('10/OCT/2021 01:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/OCT/2021');
INSERT INTO Appointment VALUES(13,7,8,TO_DATE('10/DEC/2021 01:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '03/DEC/2021');
INSERT INTO Appointment VALUES(14,8,9,TO_DATE('26/MAY/2020 03.50 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '15/MAY/2020');
INSERT INTO Appointment VALUES(15,8,9,TO_DATE('26/JUL/2020 03.50 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '18/JUL/2020');
INSERT INTO Appointment VALUES(16,9,10,TO_DATE('30/APR/2020 05.00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '28/APR/2020');
INSERT INTO Appointment VALUES(17,10,2,TO_DATE('30/OCT/2020 05.00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '23/OCT/2020');
INSERT INTO Appointment VALUES(18,10,2,TO_DATE('15/DEC/2021 10:30 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '14/DEC/2021');
INSERT INTO Appointment VALUES(19,11,5,TO_DATE('21/SEP/2020 01:30 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '19/SEP/2020');
INSERT INTO Appointment VALUES(20,11,5,TO_DATE('21/NOV/2020 01:30 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '16/NOV/2020');
INSERT INTO Appointment VALUES(21,12,3,TO_DATE('27/OCT/2021 11:15 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '25/OCT/2021');
INSERT INTO Appointment VALUES(22,12,3,TO_DATE('27/DEC/2021 11:15 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '26/DEC/2021');
INSERT INTO Appointment VALUES(23,13,4,TO_DATE('02/NOV/2021 02:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/NOV/2021');
INSERT INTO Appointment VALUES(24,13,4,TO_DATE('02/JAN/2022 02:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/JAN/2022');
INSERT INTO Appointment VALUES(25,14,7,TO_DATE('09/AUG/2021 07:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '05/AUG/2021');
INSERT INTO Appointment VALUES(26,14,7,TO_DATE('02/OCT/2021 07:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/OCT/2021');
INSERT INTO Appointment VALUES(27,16,1,TO_DATE('06/NOV/2021 03:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '02/NOV/2021');
INSERT INTO Appointment VALUES(28,16,1,TO_DATE('06/JAN/2022 03:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '03/JAN/2022');
INSERT INTO Appointment VALUES(29,18,9,TO_DATE('11/JAN/2021 03:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '05/JAN/2021');
INSERT INTO Appointment VALUES(30,18,9,TO_DATE('11/MAR/2021 07:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '02/MAR/2021');
INSERT INTO Appointment VALUES(31,19,4,TO_DATE('15/NOV/2021 01:50 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '10/NOV/2021');
INSERT INTO Appointment VALUES(32,19,4,TO_DATE('15/JAN/2022 12:30 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '13/JAN/2022');
INSERT INTO Appointment VALUES(33,21,5,TO_DATE('19/NOV/2021 01:30 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '13/NOV/2021');
INSERT INTO Appointment VALUES(34,21,5,TO_DATE('15/NOV/2021 12:45 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '13/NOV/2021');
INSERT INTO Appointment VALUES(35,22,4,TO_DATE('17/NOV/2021 01:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '13/NOV/2021');
INSERT INTO Appointment VALUES(36,22,4,TO_DATE('17/JAN/2021 01:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '15/NOV/2020');
INSERT INTO Appointment VALUES(37,23,3,TO_DATE('17/SEP/2021 08:45 A.M.', 'DD/MON/YYYY HH:MI A.M.'), '15/SEP/2021');
INSERT INTO Appointment VALUES(38,23,3,TO_DATE('14/OCT/2022 01:00 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '12/OCT/2022');
INSERT INTO Appointment VALUES(39,25,6,TO_DATE('14/SEP/2021 12:30 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '12/SEP/2021');
INSERT INTO Appointment VALUES(40,25,6,TO_DATE('12/NOV/2021 01:40 P.M.', 'DD/MON/YYYY HH:MI A.M.'), '01/NOV/2021');
INSERT INTO Price VALUES(1,1,1.5);
INSERT INTO Price VALUES(1,2,1);
INSERT INTO Price VALUES(1,3,2);
INSERT INTO Price VALUES(1,4,1.25);
INSERT INTO Price VALUES(2,1,1);
INSERT INTO Price VALUES(2,2,1.5);
INSERT INTO Price VALUES(2,3,1.75);
INSERT INTO Price VALUES(2,4,2.1);
INSERT INTO Price VALUES(3,1,1.4);
INSERT INTO Price VALUES(3,2,1);
INSERT INTO Price VALUES(3,3,1.9);
INSERT INTO Price VALUES(3,4,0.99);
INSERT INTO Price VALUES(4,1,2);
INSERT INTO Price VALUES(4,2,2.1);
INSERT INTO Price VALUES(4,3,1.99);
INSERT INTO Price VALUES(4,4,1.5);

ALTER TABLE Appointment ADD CONSTRAINT TimeConstraint CHECK (AppointmentDateTime>BookedDate);

CREATE VIEW Unfil AS SELECT Orders.OrderID, Orders.SupplierID, OrderVaccine.VaccineID, OrderVaccine.OrderQuantity, Price.Price, OrderVaccine.OrderQuantity*Price.Price*0.85 AS Total FROM OrderVaccine, Orders, Price WHERE Orders.OrderID = OrderVaccine.OrderID AND Orders.SupplierID = Price.SupplierID AND OrderVaccine.VaccineID = Price.VaccineID AND OrderVaccine.OrderQuantity>500 UNION ALL SELECT Orders.OrderID, Orders.SupplierID, OrderVaccine.VaccineID, OrderVaccine.OrderQuantity, Price.Price, OrderVaccine.OrderQuantity*Price.Price AS Total FROM OrderVaccine, Orders, Price WHERE Orders.OrderID = OrderVaccine.OrderID AND Orders.SupplierID = Price.SupplierID AND OrderVaccine.VaccineID = Price.VaccineID AND OrderVaccine.OrderQuantity<=500 ORDER BY OrderID;

CREATE VIEW TwoDoses AS SELECT DISTINCT(Patient.PatientID), Patient.FirstName, Patient.LastName, Patient.PatientDOB, Patient.PatientAge, Patient.PatientGender, Patient.PatientAddress, Patient.PatientPostcode, Patient.PatientPhoneNumber, Patient.PatientEmail, Patient.VaccineID, Patient.NHSNumber FROM Patient, Appointment WHERE Patient.PatientID = Appointment.PatientID AND Patient.Vaccinated = 'Y' AND AppointmentDateTime>add_months(sysdate,-6) AND AppointmentDateTime<sysdate ORDER BY PatientID;

CREATE TRIGGER VaccinatedTrigger
AFTER INSERT OR UPDATE ON Patient
FOR EACH ROW
BEGIN
    IF :NEW.VaccineDose=2 THEN
        INSERT INTO VaccinatedPatient VALUES(:NEW.PatientID, :NEW.FirstName, :NEW.LastName, :NEW.PatientDOB, :NEW.PatientAge, :NEW.PatientGender, :NEW.PatientAddress, :NEW.PatientPostcode, :NEW.PatientPhoneNumber, :NEW.PatientEmail, :NEW.Vaccinated, :NEW.VaccineID, :NEW.VaccineDose, :NEW.NHSNumber);
    END IF;
END VaccinatedTrigger;

CREATE TRIGGER AppointmentTrigger
BEFORE INSERT OR UPDATE ON Appointment
FOR EACH ROW
DECLARE
    vac INT;
    stockQ INT;
BEGIN
    SELECT VaccineID INTO :vac FROM Patient WHERE PatientID = :NEW.PatientID;
    SELECT StockQuantity INTO :stockQ FROM Stock WHERE VaccineID = :vac;
    IF :stockQ=0 THEN
        raise_application_error(0161, 'Vaccines are out of stock.');
    END IF;
END AppointmentTrigger;

CREATE SEQUENCE PatientSequence START WITH 26;
CREATE TRIGGER PatientTrigger
  BEFORE INSERT ON Patient
  FOR EACH ROW
BEGIN
  SELECT PatientSequence.nextval
  INTO :new.PatientID
  FROM dual;
END PatientTrigger;