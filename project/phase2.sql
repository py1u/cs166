-- Project Phase 2
-- Alex Zhang and Peter Lu
-- 5/20/24

-- drop tables for clearing database
DROP TABLE IF EXISTS User CASCADE;
DROP TABLE IF EXISTS Worker CASCADE;
DROP TABLE IF EXISTS Customer CASCADE;
DROP TABLE IF EXISTS User_updates CASCADE;
DROP TABLE IF EXISTS Catalog CASCADE;
DROP TABLE IF EXISTS RentalOrder CASCADE;
DROP TABLE IF EXISTS TrackingInfo CASCADE;
DROP TABLE IF EXISTS Worker_updates_Tracking CASCADE;
DROP TABLE IF EXISTS views CASCADE;
DROP TABLE IF EXISTS Worker_updates_Catalog CASCADE;
DROP TABLE IF EXISTS Worker_updates_Rental CASCADE;
DROP TABLE IF EXISTS RentalOrder_places CASCADE;
DROP TABLE IF EXISTS contains CASCADE;
DROP TABLE IF EXISTS check CASCADE;

--all create table commands
CREATE TABLE User
	(login CHAR(15) NOT NULL,
	Password CHAR(50) NOT NULL,
	role CHAR(10) NOT NULL,
	favGames CHAR(500),
	phoneNum CHAR(60) NOT NULL,
	numOverDueGames INT NOT NULL,
	PRIMARY KEY (login));

CREATE TABLE Worker
	(login CHAR(15) NOT NULL,
	PRIMARY KEY (login),
	FOREIGN KEY (login) REFERENCES User
ON DELETE CASCADE);

CREATE TABLE Customer
	(login CHAR(15) NOT NULL,
	PRIMARY KEY (login),
	FOREIGN KEY (login) REFERENCES User
ON DELETE CASCADE);

CREATE TABLE User_updates
	(User_login CHAR(15),
	Worker_login CHAR(15),
	PRIMARY KEY (User_login, Worker_login),
	FOREIGN KEY (User_login) REFERENCES User,
	FOREIGN KEY (Worker_login) REFERENCES Worker
		ON DELETE CASCADE);

CREATE TABLE Catalog
	(gameName CHAR(50) NOT NULL,
	genre CHAR(40) NOT NULL,
	price FLOAT NOT NULL,
	description CHAR(600),
	imageURL CHAR(256),
	PRIMARY KEY (gameName))

CREATE TABLE RentalOrder
	(login CHAR(50) NOT NULL,
	orderTimestamp TIMESTAMP NOT NULL,
	dueDate DATE NOT NULL,
	rentalOrderID CHAR(60) NOT NULL,
	totalPrice FLOAT NOT NULL,
	PRIMARY KEY (rentalOrderID))

CREATE TABLE TrackingInfo
	(trackingID CHAR(50) NOT NULL,
	status CHAR(40) NOT NULL,
	currentLocation CHAR(60) NOT NULL,
	lastUpdateDate TIMESTAMP NOT NULL,
	rentalOrderID CHAR(50) NOT NULL,
	courierName CHAR(800) NOT NULL,
	additionalComments TEXT,
	PRIMARY KEY (trackingID))

CREATE TABLE Worker_updates_Tracking
	(login CHAR(50),
	trackingID CHAR(50),
	PRIMARY KEY (login, trackingID),
	FOREIGN KEY (login) REFERENCES User,
	FOREIGN KEY (trackingID) REFERENCES TrackingInfo)

CREATE TABLE views
	(login CHAR(50),
	gameName CHAR(50),
	PRIMARY KEY (login, gameName),
	FOREIGN KEY (login) REFERENCES User,
	FOREIGN KEY (gameName) REFERENCES Catalog)

CREATE TABLE Worker_updates_Catalog
	(login CHAR(50),
	gameName CHAR(50),
	PRIMARY KEY (login, gameName),
	FOREIGN KEY (login) REFERENCES Worker,
	FOREIGN KEY (gameName) REFERENCES Catalog)

CREATE TABLE Worker_updates_Rental
	(login CHAR(50),
	rentalOrderID CHAR(50),
	PRIMARY KEY (login, rentalOrderID),
	FOREIGN KEY (login) REFERENCES Worker,
	FOREIGN KEY (rentalOrderID) REFERENCES RentalOrder)

CREATE TABLE RentalOrder_places
	(Customer_login CHAR(50) NOT NULL,
    login CHAR(50) NOT NULL,
	orderTimestamp TIMESTAMP NOT NULL,
	dueDate DATE NOT NULL,
	rentalOrderID CHAR(60) NOT NULL,
	totalPrice FLOAT NOT NULL,
	PRIMARY KEY (rentalOrderID)
FOREIGN KEY (Customer_login) REFERENCES Customer)

CREATE TABLE contains
	(trackingID CHAR(50) NOT NULL,
	rentalOrderID CHAR(50) NOT NULL,
	PRIMARY KEY (trackingID, rentalOrderID),
	FOREIGN KEY (trackingID) REFERENCES TrackingInfo,
	FOREIGN KEY (rentalOrderID) REFERENCES RentalOrder)

CREATE TABLE check
	(trackingID CHAR(50) NOT NULL,
	rentalOrderID CHAR(50) NOT NULL,
	Customer_login CHAR(50),
	PRIMARY KEY (trackingID, rentalOrderID),
	FOREIGN KEY (trackingID) REFERENCES TrackingInfo,
	FOREIGN KEY (rentalOrderID) REFERENCES RentalOrder,
	FOREIGN KEY (Customer_login) REFERENCES Customer)
