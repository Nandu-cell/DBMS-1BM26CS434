Create database Bank;
Use Bank;

create table Branch
(BRANCHNAME varchar(30) primary key,
BRANCHCITY varchar(20),
ASSETS int);

DESC Branch;

create table BankAccount
(ACCNO int primary key,
BRANCHNAME varchar(30),
BALANCE int,
foreign key (BRANCHNAME) references Branch(BRANCHNAME));

DESC BankAccount;

create table BankCustomer
(CUSTOMERNAME varchar(20) primary key,
CUSTOMERSTREET varchar(30),
CUSTOMERCITY varchar(20));

DESC BankCustomer;

create table Loan
(LOANNUMBER int primary key,
BRANCHNAME varchar(30),
AMOUNT int,
foreign key (BRANCHNAME) references Branch(BRANCHNAME));

DESC Loan;

create table Depositer
(CUSTOMERNAME varchar(20),
ACCNO int,
primary key (CUSTOMERNAME, ACCNO),
foreign key (CUSTOMERNAME) references BankCustomer(CUSTOMERNAME),
foreign key (ACCNO) references BankAccount(ACCNO));

DESC Depositer;

insert into Branch values
('SBI_Chamrajpet','Bangalore',50000),
('SBI_ResidencyRoad','Bangalore',10000),
('SBI_ShivajiRoad','Bombay',20000),
('SBI_ParliamentRoad','Delhi',10000),
('SBI_Jantarmantar','Delhi',20000),
('SBI_MantriMarg','Delhi',200000);

select * from Branch;

insert into BankAccount values
(1,'SBI_Chamrajpet',2000),
(2,'SBI_ResidencyRoad',5000),
(3,'SBI_ShivajiRoad',6000),
(4,'SBI_ParliamentRoad',9000),
(5,'SBI_Jantarmantar',8000),
(6,'SBI_ShivajiRoad',4000),
(8,'SBI_ResidencyRoad',4000),
(9,'SBI_ParliamentRoad',3000),
(10,'SBI_ResidencyRoad',5000),
(11,'SBI_Jantarmantar',2000),
(12,'SBI_MantriMarg',2000);

select * from BankAccount;

insert into BankCustomer values
('Avinash','Bull_Temple_Road','Bangalore'),
('Dinesh','Bannergatta_Road','Bangalore'),
('Mohan','NationalCollege_Road','Bangalore'),
('Nikil','Akbar_Road','Delhi'),
('Ravi','Prithviraj_Road','Delhi');

select * from BankCustomer;

insert into Loan values
(1,'SBI_Chamrajpet',1000),
(2,'SBI_ResidencyRoad',2000),
(3,'SBI_ShivajiRoad',3000),
(4,'SBI_ParliamentRoad',4000),
(5,'SBI_Jantarmantar',5000);

select * from Loan;

insert into Depositer values
('Avinash',1),
('Dinesh',2),
('Nikil',4),
('Ravi',5),
('Avinash',8),
('Nikil',9),
('Dinesh',10),
('Nikil',11),
('Nikil',12);

select * from Depositer;

SELECT BRANCHNAME, ASSETS/100000 AS 'assets in lakhs' FROM Branch;

SELECT D.CUSTOMERNAME, BA.BRANCHNAME, count(*) AS No_of_Accounts
FROM Depositer D, BankAccount BA
WHERE D.ACCNO = BA.ACCNO
GROUP BY D.CUSTOMERNAME, BA.BRANCHNAME
HAVING COUNT(*) >= 2;

CREATE VIEW Branch_Loan_Sum AS
SELECT BRANCHNAME, SUM(AMOUNT) AS Total_Loan_Amount
FROM Loan
GROUP BY BRANCHNAME;

SELECT * FROM Branch_Loan_Sum;