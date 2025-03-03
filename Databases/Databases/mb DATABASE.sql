CREATE TABLE Boat(
boat_ID CHAR(5),
model VARCHAR(15),
dateBought DATE,
priceOfBoat DECIMAL(4,2),
manufacturer_ID INT(2),
disposal_ID INT(4),
boatType VARCHAR(10),
CONSTRAINT PRIMARY KEY(boat_ID),
 CONSTRAINT manufacturer_ID_fk FOREIGN KEY(manufacturer_id) REFERENCES Manufacturer (manufacturer_ID),
CONSTRAINT disposal_ID_fk FOREIGN KEY(disposal_ID) REFERENCES Disposal(disposal_ID),
CONSTRAINT boat_Type_fk FOREIGN KEY(boatType) REFERENCES boatClassification(boatType)
);

CREATE TABLE Maintenance(
maintenance_ID INT(7),
referenceNumber INT (4),
faultDetails varchar(100),
faultDate date,
actionTaken varchar(100),
actionDate date,
lastServiceDate date,
priority INT (1),
boat_ID char (5),
CONSTRAINT PRIMARY KEY (maintenance_ID),
CONSTRAINT boat_ID_fk FOREIGN KEY(boat_ID) REFERENCES Boat(boat_ID)
);

CREATE TABLE boatClassification(
boatType VARCHAR(10),
halfDayPrice DECIMAL(3,2),
fullDayPrice DECIMAL(3,2),
CONSTRAINT PRIMARY KEY(boatType)
);

CREATE TABLE Reservation (
reservation_ID INT(5),
reservationDate Date,
boatClass VARCHAR(10),
boatSize VARCHAR(10),
daysReserved INT(2),
hirePrice DECIMAL(3,2),
paid CHAR(1),
customer_ID INT(2),
boatType VARCHAR(10),
CONSTRAINT PRIMARY KEY (reservation_ID),
CONSTRAINT customer_ID_fk FOREIGN KEY(customer_ID) REFERENCES Customer(customer_ID),
CONSTRAINT boat_Type_fk FOREIGN KEY(boatType) REFERENCES boatClassification(boatType)
);


CREATE TABLE Rental(
rental_ID INT(5),
rentalDate Date,
rentPeriod INT(2),
returnDate Date,
returnedDate Date,
amountPaid DECIMAL(3,2),
customer_ID INT(2),
boat_ID CHAR(5),
CONSTRAINT PRIMARY KEY (rental_ID),
CONSTRAINT customer_ID_fk FOREIGN KEY(customer_ID) REFERENCES Customer(customer_ID),
CONSTRAINT boat_ID_fk FOREIGN KEY(boat_ID) REFERENCES Boat(boat_ID)
);

CREATE TABLE Customer(
customer_ID INT(2),
firstName VARCHAR(15),
lastName VARCHAR(15),
telephone CHAR(11),
address VARCHAR(100),
email VARCHAR(50),
CONSTRAINT PRIMARY KEY(customer_ID)
);


CREATE TABLE Disposal(
disposal_ID INT(4),
saleDate DATE,
salePrice DECIMAL(5,2),
dealer_ID INT(2),
CONSTRAINT PRIMARY KEY (disposal_ID),
CONSTRAINT dealer_ID_fk FOREIGN KEY (dealer_ID) REFERENCES Dealer(dealer_ID)
);

CREATE TABLE Dealer(
dealer_ID INT(2),
name VARCHAR(50),
telephone CHAR(11),
address VARCHAR(100),
email VARCHAR(50),
CONSTRAINT PRIMARY KEY (dealer_ID)
);

CREATE TABLE Manufacturer(
manufacturer_ID INT(2),
name VARCHAR(50),
telephone CHAR(11),
address VARCHAR(100),
email VARCHAR(50),
CONSTRAINT PRIMARY KEY (manufacturer_ID)
);

CREATE TABLE PartOrder(
order_ID INT(5),
date Date,
price DECIMAL(3,2),
manufacturer_ID INT(2),
CONSTRAINT PRIMARY KEY (order_ID),
CONSTRAINT manufacturer_ID_fk FOREIGN KEY (manufacturer_ID) REFERENCES Manufacturer(manufacturer_ID)
);

CREATE TABLE Part(
part_ID INT(4),
quantity INT(3),
type VARCHAR(15),
model VARCHAR(15),
order_ID INT(5),
 CONSTRAINT PRIMARY KEY (part_ID),
CONSTRAINT order_ID_fk FOREIGN KEY (order_ID) REFERENCES PartOrder(order_ID)
);


