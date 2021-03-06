CREATE DATABASE IF NOT EXISTS 160259G;
USE DATABASE 160259G;
CREATE TABLE IF NOT EXISTS Employee(
	EID VARCHAR(15) NOT NULL,
	NID VARCHAR(15) NOT NULL,
	E_address VARCHAR(15) NOT NULL,
	sex ENUM("Male", "Female") NOT NULL,
	history VARCHAR(255) NOT NULL,
	E_type ENUM("Receptionist","Doctor","Nurse") NOT NULL,
	salary FLOAT(15,3) NOT NULL,
	PRIMARY KEY(EID)
);
CREATE TABLE IF NOT EXISTS Doctor(
	EID VARCHAR(15) NOT NULL,
	D_type ENUM("Trainee","Permanent","Visiting") NOT NULL,
	PRIMARY KEY(EID),
	FOREIGN KEY(EID) REFERENCES Employee(EID)
);
CREATE TABLE IF NOT EXISTS Rooms(
	rooms_id VARCHAR(15) NOT NULL,
	period VARCHAR(10) NOT NULL,
	Nurse_ID VARCHAR(15),
	PRIMARY KEY(rooms_id),
	FOREIGN KEY(Nurse_ID) REFERENCES Employee(EID)
	
);
CREATE TABLE IF NOT EXISTS Patient(
	PID VARCHAR(15) NOT NULL,
	name VARCHAR(15) NOT NULL,
	sex ENUM("Male", "Female") NOT NULL,
	address VARCHAR(15) NOT NULL,
	date_admitted DATE NOT NULL,
	date_discharged DATE NOT NULL,
	Doctor_ID VARCHAR(15) NOT NULL,
	Assigned_room_id VARCHAR(15) NOT NULL,
	PRIMARY KEY(PID),
	FOREIGN KEY(Doctor_ID) REFERENCES Doctor(EID),
	FOREIGN KEY(Assigned_room_id) REFERENCES Rooms(rooms_id)
);

CREATE TABLE IF NOT EXISTS P_Contact_No(
	PID VARCHAR(15) NOT NULL,
	contact_no INT(15),
	PRIMARY KEY(PID,contact_no),
	FOREIGN KEY(PID) REFERENCES Patient(PID)
);



CREATE TABLE IF NOT EXISTS Room_Type(
	rooms_id VARCHAR(15) NOT NULL,
	room_type VARCHAR(15) NOT NULL,
	PRIMARY KEY(rooms_id,room_type),
	FOREIGN KEY(rooms_id) REFERENCES Rooms(rooms_id)
);


CREATE TABLE IF NOT EXISTS E_names(
	EID VARCHAR(8) NOT NULL,
	E_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(EID,E_name),
	FOREIGN KEY(EID) REFERENCES Employee(EID)
);
CREATE TABLE IF NOT EXISTS E_Contact_num(
	EID VARCHAR(8) NOT NULL,
	contact_num INT(10) NOT NULL,
	PRIMARY KEY(EID,contact_num),
	FOREIGN KEY(EID) REFERENCES Employee(EID)
);
CREATE TABLE IF NOT EXISTS Records(
	record_no VARCHAR(8) NOT NULL,
	discription VARCHAR(255) NOT NULL,
	patient_id VARCHAR(15) NOT NULL,
	appointment VARCHAR(15) NOT NULL,
	Receptionist_ID VARCHAR(15) NOT NULL,
	PRIMARY KEY(record_no),
	FOREIGN KEY(patient_id) REFERENCES Patient(PID),
	FOREIGN KEY(Receptionist_ID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Treatment(
	TID VARCHAR(15) NOT NULL,
	description  VARCHAR(255) NOT NULL,
	PRIMARY KEY(TID)

);
CREATE TABLE IF NOT EXISTS Bill(
	BID VARCHAR(15) NOT NULL,
	TID VARCHAR(15) NOT NULL,
	PID VARCHAR(15) NOT NULL,
	PRIMARY KEY(BID),
	FOREIGN KEY(TID) REFERENCES Treatment(TID),
	FOREIGN KEY(PID) REFERENCES Patient(PID)	
);
CREATE TABLE IF NOT EXISTS Medicine(
	code VARCHAR(15) NOT NULL,
	BID VARCHAR(15) NOT NULL,
	PID VARCHAR(15) NOT NULL,
	quantity VARCHAR(15) NOT NULL,
	price FLOAT(15,3) NOT NULL,
	PRIMARY KEY(code),
	FOREIGN KEY(BID) REFERENCES Bill(BID)
);

INSERT INTO `Employee`(`EID`, `NID`, `E_Address`, 'sex',  `history`, `E_type`,  `salary`)
VALUES ("E1", "9629200", "no.65,maradana", "Male", "dffgsdfg", "Doctor", "65000.00" );
