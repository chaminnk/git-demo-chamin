create database 160047f;
use 160047f;
create table Employee(
	EID varchar(255),
	sex enum("Male","Female","Other") NOT NULL,
	NID varchar(255) NOT NULL,
	E_address text NOT NULL,
	salary int(100),
	history text,
	category enum("Doctor","Nurse","Receptionist") NOT NULL,
	primary key(EID)
);

create table Employee_contact_number(
	ID int(255) NOT NULL AUTO_INCREMENT,
	EID varchar(255) NOT NULL,
	contact_no int(20) NOT NULL,
	primary key(ID),
	FOREIGN KEY (EID) REFERENCES Employee(EID)
);

create table Employee_name(
	ID int(255) NOT NULL AUTO_INCREMENT,
	EID varchar(255) NOT NULL,
	E_name varchar(255) NOT NULL,
	primary key(ID),
	FOREIGN KEY (EID) REFERENCES Employee(EID)
);
create table Patient(
	PID varchar(255),
	name varchar(255) NOT NULL,
	sex enum("Male","Female","Other") NOT NULL,
	address text NOT NULL,
	doctor_EID varchar(255) NOT NULL,
	primary key(PID),
	FOREIGN KEY (doctor_EID) REFERENCES Employee(EID)
);
create table Patient_contact_number(
	ID int(255) NOT NULL AUTO_INCREMENT,
	PID varchar(255) NOT NULL,
	contact_no int(20) NOT NULL,
	primary key(ID),
	FOREIGN KEY (PID) REFERENCES Patient(PID)
);
create table Pdetails(
	PID varchar(255),
	date_admitted date NOT NULL,
	date_discharged date NOT NULL,
	primary key(PID),
	FOREIGN KEY (PID)
	REFERENCES Patient(PID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
create table Bill(
	BID varchar(255),
	description text,
	treatment enum("Treatment1","Treatment2","Treatment3","Treatment4") NOT NULL,
	PID varchar(255) NOT NULL,
	primary key(BID),
	FOREIGN KEY (PID)
	REFERENCES Patient(PID)
);
create table Medicine(
	code varchar(255),
	BID varchar(255) NOT NULL,
	quantity int(100) NOT NULL,
	price float(100,4) NOT NULL,
	PID varchar(255) NOT NULL,
	primary key(code),
	FOREIGN KEY (BID)
	REFERENCES Bill(BID)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
create table Room(
	rooms_id varchar(255),
	nurse_EID varchar(255),
	primary key(rooms_id),
	FOREIGN KEY (nurse_EID) REFERENCES Employee(EID)
);

create table Room_type(
	ID int(255) NOT NULL AUTO_INCREMENT,
	rooms_id varchar(255) NOT NULL,
	room_type varchar(255) NOT NULL,
	primary key(ID),
	FOREIGN KEY (rooms_id) REFERENCES Room(rooms_id)
);

create table Doctor(
	EID varchar(255),
	category enum("Trainee","Visiting","Permanent") NOT NULL,
	primary key(EID),
	FOREIGN KEY (EID)
	REFERENCES Employee(EID)
);
create table Record(
	record_no varchar(255),
	description text NOT NULL,
	patient_id varchar(255),
	appointment varchar(255),
	Receptionist_EID varchar(255),
	primary key(record_no),
	FOREIGN KEY (Receptionist_EID) REFERENCES Employee(EID),
	FOREIGN KEY (patient_id) REFERENCES Patient(PID)
);

INSERT INTO `employee`(`EID`, `sex`, `NID`, `E_address`, `salary`, `history`, `category`)
VALUES ("E1","Male","160047FD","No:254, Araliya roard, Horana.",125000,"No history","Doctor");

INSERT INTO `employee`(`EID`, `sex`, `NID`, `E_address`, `salary`, `history`, `category`)
VALUES ("E2","Female","160047FN","No:254, Araliya roard, Horana.",35000,"No history","Nurse");

INSERT INTO `employee`(`EID`, `sex`, `NID`, `E_address`, `salary`, `history`, `category`)
VALUES ("E3","Female","160047FR","No:254, Araliya roard, Horana.",25000,"No history","Receptionist");

INSERT INTO `employee_contact_number`(`ID`, `EID`, `contact_no`) VALUES (NULL,"E1","0774567891");

INSERT INTO `employee_contact_number`(`ID`, `EID`, `contact_no`) VALUES (NULL,"E2","0774567892");

INSERT INTO `employee_contact_number`(`ID`, `EID`, `contact_no`) VALUES (NULL,"E3","0774567893");

INSERT INTO `doctor`(`EID`, `category`) VALUES ("E1","Permanent");

INSERT INTO `employee_name`(`ID`, `EID`, `E_name`) VALUES (NULL,"E1","Ranjith");
INSERT INTO `employee_name`(`ID`, `EID`, `E_name`) VALUES (NULL,"E1","Pushpakumara");
INSERT INTO `employee_name`(`ID`, `EID`, `E_name`) VALUES (NULL,"E2","Ayesha");
INSERT INTO `employee_name`(`ID`, `EID`, `E_name`) VALUES (NULL,"E3","Isuri");

INSERT INTO `patient`(`PID`, `name`, `sex`, `address`, `doctor_EID`) 
VALUES ("P1","Athukorala","Male","No:254, Araliya roard, Horana.","E1");

INSERT INTO `patient_contact_number`(`ID`, `PID`, `contact_no`) VALUES (NULL,"P1","0772546315");

INSERT INTO `pdetails`(`PID`, `date_admitted`, `date_discharged`) VALUES ("P1","2018-09-12","2018-09-15");

INSERT INTO `room`(`rooms_id`, `nurse_EID`) VALUES ("R1","E2");

INSERT INTO `room_type`(`ID`, `rooms_id`, `room_type`) VALUES (NULL,"R1","AC");

INSERT INTO `record`(`record_no`, `description`, `patient_id`, `appointment`, `Receptionist_EID`) 
VALUES ("Reco1","This is a description","P1","asgag","E3");

INSERT INTO `bill`(`BID`, `description`, `treatment`, `PID`) VALUES ("Bill1","asfjkbj","Treatment1","P1");

INSERT INTO `medicine`(`code`, `BID`, `quantity`, `price`, `PID`) VALUES ("Medi212","Bill1","5","205.2","P1");
INSERT INTO `medicine`(`code`, `BID`, `quantity`, `price`, `PID`) VALUES ("Medi213","Bill1","15","245.2","P1");