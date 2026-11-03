SHOW databases;

CREATE database bankingDB;
use bankingdb;

create table customers (
customerID int,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
phone varchar(10)
);

desc customers;

alter table customers
add constraint pk_customer_ID primary key (customerID);

select * from customers;

alter table customers
add AccountCreationDate date;

alter table customers
add DateOfBirth date;

alter table customers
modify Phone varchar(20);

desc customers;

alter table Customers
modify FirstName varchar(50) not null;

alter table Customers
add constraint uq_Email unique (Email);

alter table customers 
alter column lastname set default "NA";

create table Accounts (
AccountID int,
AccountType varchar(20),
Balance decimal(10,2)
);

desc Accounts;

alter table Accounts
add constraint pk_Account_ID primary key (AccountID);

alter table Accounts
add constraint chk_MinBalance
check (Balance >= 1000);

alter table Accounts
add CustomerID int;
alter table Accounts
add constraint fk_Accounts_Customers
foreign key (CustomerID)
references customers(CustomerID);

create table Transaction(
TransactionID int,
TransactionDate date,
account decimal(10,2),
TransactionType varchar(20)
);


alter table transaction
add AccountID int;
alter table transaction
add constraint fk_transaction_account
foreign key(AccountID)
references Accounts(AccountID);

desc Transaction;

alter table Transaction
add constraint pk_Transaction_ID primary key (TransactionID);

create table Branches (
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15)
);
desc Branches;

alter table Branches
add constraint pk_Branch_ID primary key (BranchID);

create table AccountBranches (
AssignmentDate date
);
desc accountBranches;

drop table AccountBranches;

alter table accounts
add branchID int;
alter table Accounts
add constraint fk_Accounts_Branches
foreign key(BranchID)
references Branches(BranchID);

create table Loans(
LoanID int, 
LoanAmmount Decimal(10,2),
InterestRate Decimal(5,2),
StartDate date,
EndDate date
);

desc Loans;

ALTER TABLE Loans
ADD CONSTRAINT pk_Loan_ID PRIMARY KEY (LoanID);

alter table Loans
add CustomerID int;
alter table Loans
add constraint fk_Loans_customer
foreign key(CustomerID)
references Customers(CustomerID);

create table KYC(
KYCID int primary key,
Adhar_num varchar(12) not null,
Pan_num varchar(10) not null,
CustomerID int not null,
constraint fk_customer
foreign key(customerID) references Customers(CustomerID)
);
drop table KYC;

create table KYC(
KYCID int primary key,
Adhar_num varchar(12) not null,
Pan_num varchar(10) not null,
CustomerID int not null,
constraint fk_customer
foreign key(customerID) references Customers(CustomerID)
);

show create table KYC; -- you can change table name as per your requirement

-- you can get information about contraints applied on a specific table
-- by the query written below
select
constraint_name,
constraint_type
from information_schema.table_constraints
where table_schema = 'bankingdb'
and table_name = 'KYC';

drop database  bankingdb123;

use bankingdb;

insert into Customers
values
(101,'Amit','Sharma','amit@gmail.com','9876543210','2024-01-15','1998-05-01');

select * from customers;

insert into Customers
(customerid,firstname,lastname,email,phone,accountcreationdate,dateofbirth)
values(102,'Pria','Patil','pria@gmail.com','9876543211','2024-02-10','1999-08-22');

use bankingdb;

insert into Customers
(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerid)
values ('98776543212','rahul@gmail,com','Verma','Rahul','2024-03-12','1997-11-14',103);

select * from customers;

INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

select * from customers;

INSERT INTO Branches
VALUES
(1,'Nagpur Branch','Sitabuldi, Nagpur','0712-123456'),
(2,'Pune Branch','Shivaji Nagar, Pune','020-223344'),
(3,'Mumbai Branch','Andheri, Mumbai','022-334455');

select * from branches;

INSERT INTO Accounts
VALUES
(1001,'Savings',25000,101,1),
(1002,'Current',45000,102,2),
(1003,'Savings',18000,103,1),
(1004,'Current',72000,104,3),
(1005,'Savings',15000,105,2);

select * from accounts;

INSERT INTO Transaction
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);

select * from transaction;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

update customers
set email = 'amit2026@yahoo.com'
where customerid = 101;

update customers
set lastname = 'Joshi'
where customerid = 102;

update customers
set lastname = 'Sharma'
where customerid = '101';

select * from customers;

select * from branches;

update branches
set branchaddress = 'Civil Lines, Nagpur',
branchphone = '0712-562629'
where branchid = 1;

select * from branches;

select * from kyc;

insert into kyc
values (701,'4526325698','AVFDG45265',101),
(702,'9626362698','SFKJF4554K',102),
(703,'2356452515','DAKFJ6234L',103),
(704,'2356452145','DFKSD4562H',104);

delete from kyc where kycid = 702;

select * from kyc;

delete from kyc;



