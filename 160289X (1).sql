CREATE database IF NOT EXISTS 160289X;
use 160289X;


CREATE TABLE IF NOT EXISTS Employee(
	EID varchar(255),
	NID varchar(255) NOT NULL,
	E_Address text NOT NULL,
	Salary int(100),
	History text,
	Sex enum("Male","Female","Other") NOT NULL,
	Types enum("Doctor","Nurse","Receptionist") NOT NULL,
	
	primary key(EID)
);

CREATE TABLE IF NOT EXISTS Econtact(
	ID int(255) NOT NULL AUTO_INCREMENT,
	EID varchar(255) NOT NULL,
	Contact_no int(20) NOT NULL,
	
	primary key(ID),
	FOREIGN KEY (EID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS E_Name(
	ID int(255) NOT NULL AUTO_INCREMENT,
	EID varchar(255) NOT NULL,
	E_Name varchar(255) NOT NULL,
	
	primary key(ID),
	FOREIGN KEY (EID) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Patient(
	PID varchar(255),
	Name varchar(255) NOT NULL,
	Sex enum("Male","Female","Other") NOT NULL,
	Address text NOT NULL,
	Doctor_id varchar(255) NOT NULL,
	Admitted_date date NOT NULL,
	Discharged_date date NOT NULL,
	
	primary key(PID),
	FOREIGN KEY (Doctor_id) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Pcontact(
	ID int(255) NOT NULL AUTO_INCREMENT,
	PID varchar(255) NOT NULL,
	Contact_no int(20) NOT NULL,
	
	primary key(ID),
	FOREIGN KEY (PID) REFERENCES Patient(PID)
);

CREATE TABLE IF NOT EXISTS Treatment(
	TID varchar(255) NOT NULL,
	
	primary key(TID)

);

CREATE TABLE IF NOT EXISTS Bill(
	BID varchar(255),
	TID varchar(255) NOT NULL,
	PID varchar(255) NOT NULL,
	
	primary key(BID),
	FOREIGN KEY (PID)REFERENCES Patient(PID),
	FOREIGN KEY (TID) REFERENCES Treatment(TID)
	
);


CREATE TABLE IF NOT EXISTS Medicine(
	Code varchar(255),
	BID varchar(255) NOT NULL,
	Quantity int(100) NOT NULL,
	Price float(100,4) NOT NULL,
	PID varchar(255) NOT NULL,
	
	primary key(Code),
	FOREIGN KEY (BID)REFERENCES Bill(BID)
);


CREATE TABLE IF NOT EXISTS Room(
	Rooms_id varchar(255),
	EID_nurse varchar(255),
	
	primary key(Rooms_id),
	FOREIGN KEY (EID_nurse) REFERENCES Employee(EID)
);

CREATE TABLE IF NOT EXISTS Room_type(
	ID int(255) NOT NULL AUTO_INCREMENT,
	Rooms_id varchar(255) NOT NULL,
	room_type varchar(255) NOT NULL,
	
	primary key(ID),
	FOREIGN KEY (Rooms_id) REFERENCES Room(Rooms_id)
);

CREATE TABLE IF NOT EXISTS Doctor(
	EID varchar(255),
	Types enum("Trainee","Visiting","Permanent") NOT NULL,
	
	primary key(EID),
	FOREIGN KEY (EID) REFERENCES Employee(EID)
);
CREATE TABLE IF NOT EXISTS Records(

	Records_no varchar(255),
	Discription text NOT NULL,
	Patient_id varchar(255),
	Appointment varchar(255),
	Receptionist_EID varchar(255),
	
	primary key(Records_no),
	FOREIGN KEY (Receptionist_EID) REFERENCES Employee(EID),
	FOREIGN KEY (Patient_id) REFERENCES Patient(PID)
);

INSERT INTO `employee`(`EID`, `Sex`, `NID`, `E_Address`, `Salary`, `History`, `Types`)
VALUES ("Employee1","Male","160289X","no.117, colombo7",15000,"None","Receptionist");

INSERT INTO `employee`(`EID`, `Sex`, `NID`, `E_Address`, `Salary`, `History`, `Types`)
VALUES ("Employee2","Male","160670H","no.117, colombo8",20000,"two years work experience","Doctor");

INSERT INTO `employee`(`EID`, `Sex`, `NID`, `E_Address`, `Salary`, `History`, `Types`)
VALUES ("Employee3","Female","160067P","no.117, colombo10",17000,"None","Nurse");

INSERT INTO `econtact`(`ID`, `EID`, `Contact_no`) VALUES (NULL,"Employee1","0711234567");

INSERT INTO `econtact`(`ID`, `EID`, `Contact_no`) VALUES (NULL,"Employee2","0711234567");

INSERT INTO `econtact`(`ID`, `EID`, `Contact_no`) VALUES (NULL,"Employee3","0711234567");

INSERT INTO `doctor`(`EID`, `Types`) VALUES ("Employee2","Trainee");

INSERT INTO `e_Name`(`ID`, `EID`, `E_Name`) VALUES (NULL,"Employee1","charith");
INSERT INTO `e_Name`(`ID`, `EID`, `E_Name`) VALUES (NULL,"Employee1","rajapaksha");
INSERT INTO `e_Name`(`ID`, `EID`, `E_Name`) VALUES (NULL,"Employee2","chamath");
INSERT INTO `e_Name`(`ID`, `EID`, `E_Name`) VALUES (NULL,"Employee3","vinura");

INSERT INTO `patient`(`PID`, `Name`, `Sex`, `Address`, `Doctor_id`, `Admitted_date`, `Discharged_date`) 
VALUES ("Patient1","chathura","Male","no.117, colombo8","Employee2","2018-09-12","2018-09-13");

INSERT INTO `pcontact`(`ID`, `PID`, `Contact_no`) VALUES (NULL,"Patient1","0711234567");

INSERT INTO `room`(`Rooms_id`, `EID_nurse`) VALUES ("Room1","Employee3");

INSERT INTO `room_type`(`ID`, `Rooms_id`, `room_type`) VALUES (NULL,"Room1","None");

INSERT INTO `records`(`Records_no`, `Discription`, `Patient_id`, `Appointment`, `Receptionist_EID`) 
VALUES ("Record1","none","Patient1","appoinment","Employee1");

INSERT INTO `treatment`(`TID`) VALUES ('TreatmentA');

INSERT INTO `bill`(`BID`, `TID`, `PID`) VALUES ("no1","TreatmentA","Patient1");

INSERT INTO `medicine`(`Code`, `BID`, `Quantity`, `Price`, `PID`) VALUES ("medi_no1","no1","1","500.0","Patient1");
INSERT INTO `medicine`(`Code`, `BID`, `Quantity`, `Price`, `PID`) VALUES ("medi_no2","no1","3","1500.0","Patient1");
INSERT INTO `medicine`(`Code`, `BID`, `Quantity`, `Price`, `PID`) VALUES ("medi_no3","no1","6","1530.0","Patient1");