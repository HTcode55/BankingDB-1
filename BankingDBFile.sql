SHOW databases;

create database bankingDB;
use bankingDB;

create table customers(
customerID int,
firstname varchar(50),
lastname varchar(50),
email varchar(100),
phone varchar(10)
);

alter table customers
add constraint PK_CustomerID primary key (customerID);

alter table customers
add DateofBirth date;

desc customers;

select * from customers; 

ALTER table customers
ADD AccountCreationDate Date;

create table Accounts(
AccountID int,
AccountType varchar(20),
balance decimal(10,2)
);
alter table accounts
add constraint PK_AccountId primary key (AccountID);

alter table accounts
add constraint Chk_MinBalance
check (balance >= 1000);

alter table accounts
add CustomerID int;

alter table accounts
add constraint FK_Account_Customers
foreign key (customerID)
references customers(customerID);

alter table accounts
add BranchID int;

alter table accounts
add constraint FK_Account_Branches
foreign key (BranchID)
references branches(BranchID);

desc accounts;

create table transactions(
TransactionID int,
TransactionDate date,
Ammount decimal(10,2),
TransationType varchar(20)
);
alter table transactions
add constraint PK_TransactionID primary key (TransactionID);

alter table transactions
add AccountID int;

alter table transactions
add constraint FK_Transaction_Account
foreign key (AccountID)
references accounts(accountid);

desc transactions;

create table Branches(
BranchID int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(10)
);
alter table Branches
add constraint PK_BranchID primary key (branchID);

create table AccountBranches(
AssigmentDate date
);

drop table accountbranches;


    desc accountbranches;
    
select * from branches;

create table Loans(
LoanID int,
LoanAmount decimal(10,2),
InterestRate decimal(5,2),
Startdate date,
Enddate date
);
alter table loans
add constraint PK_LoanID primary key (LoanID);

alter table loans
add CustomerID int;

alter table loans
add constraint FK_Loans_Customers
foreign key (CustomerID)
references customers(customerID);

desc loans;

alter table loans
change Enddtae EndDate date;

alter table customers
modify phone varchar(20);

alter table customers
modify firstname varchar(50) NOT null;

desc customers;

alter table customers
add constraint UN_Email unique (Email);

alter table customers
alter column lastname set default "NA";

desc transactions;

select * from accounts;

create table KYC(
KYC_ID int primary key,
Adhar_num varchar(15),
Pan_num varchar(15),
customerID int,
foreign key (customerID) references customers(customerID)
);

desc kyc;

alter table kyc
modify Adhar_num varchar(15) not null;

alter table kyc
modify Pan_num varchar(10) not null;

show create table Accounts;

select
constraint_name,
constraint_type
from information_schema.table_constraints
where table_schema = 'bankingdb'
and table_name = 'accounts';

-- this is only for check table


-- DML START :-

insert into customers
values(101,'Amit','Sharma','amit@gmail.com','9876543210','2024-01-15','1998-05-10');

select * from customers;

insert into customers(customerID,Firstname,Lastname,Email,Phone,accountcreationdate,dateofbirth)
values(102,'Priya','Patil','priya@gmail.com','9876543211','2024-02-01','1999-08-22');

insert into customers(phone,email,lastname,firstname,accountcreationdate,dateofbirth,customerID)
values('9876543212','rahul@gmail.com','Verma','Rahul','2024-03-12','1997-11-14',103);
INSERT INTO Customers
VALUES
(104,'Sneha','Joshi','sneha@gmail.com','9876543213','2024-04-18','2000-01-05'),
(105,'Karan','Mehta','karan@gmail.com','9876543214','2024-05-25','1996-12-30');

alter table branches
modify BranchPhone varchar(15);

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

INSERT INTO Transactions
VALUES
(1,'2025-01-10',5000,'Deposit',1001),
(2,'2025-01-12',2000,'Withdrawal',1001),
(3,'2025-01-13',7000,'Deposit',1002),
(4,'2025-01-15',3000,'Withdrawal',1003),
(5,'2025-01-16',10000,'Deposit',1004);

select * from transactions;

INSERT INTO Loans
VALUES
(501,500000,8.5,'2024-01-01','2029-01-01',101),
(502,250000,9.0,'2024-03-15','2028-03-15',103),
(503,700000,7.8,'2024-06-20','2031-06-20',104);

select * from loans;

update customers
set email = 'amit2026@gmail.com'
where customerID = 101;

update customers
set lastname = 'Joshi'
where customerID =102;

 select * from customers;
 
 update branches
 set branchaddress = 'Civil Lines, Nagpur',
 branchphone = '0712-562692'
 where branchid = 1;
 
 select * from KYC;
 
 insert into KYC
 values(701,'2753-6326-2678','HNF3678578',101),
 (702,'2738-6372-8356','HFDF749639',102),
 (703,'3648-6283-7363','HJJ739679',103);
 
alter table KYC
modify Pan_num varchar(15);

delete from KYC where KYC_ID = 702;

delete from kyc;

-- DQL START :-

select firstname,email from customers;

select * from accounts
where balance > 40000;

select AccountID,accounttype,balance from accounts
where balance > 40000;

select AccountID,accounttype,balance from accounts
where accounttype = "current";

select * from customers
where customerid = 104;

-- AND Oprater
select * from accounts
where AccountType = 'savings' and balance >= 20000;

select * from accounts;

-- OR Oprater
select * from accounts
where AccountType = 'savings' or balance >= 20000;

-- NOT Oprater
select * from accounts
where not accounttype = 'savings';

select * from accounts
where  accounttype <> 'savings';

select * from accounts
where accounttype != 'savings';

-- IN OPrater
select * from loans
where interestrate = 8.50 or interestrate = 9;

select * from loans
where interestrate in (8.5,9);

-- BETWEEN Oprator
select * from loans
where interestrate between 7.5 and 8.5;

select * from accounts
where AccountType = 'current' and balance between 20000 and 60000;

-- LIKE Oprator
select * from customers
where lastname like 'J%';

select * from customers
where lastname like '%a';

select * from customers
where firstname like 'A___';

 -- Sorting 
 select * from accounts
 order by balance;
 
  select * from accounts
 order by balance desc;
 
 select * from accounts
 order by balance desc, BranchID desc; 
 
 
 insert INTO branches (BranchID, BranchName, BranchAddress, BranchPhone) VALUES
(4, 'Nashik Branch',      'College Road, Nashik',      NULL),
(5, 'Chandrapur Branch',  NULL,                        '07172-250100'),
(6, 'Aurangabad Branch',  'Station Road, Aurangabad',  '0240-334455');

select * from branches;

INSERT INTO customers (customerID, FirstName, lastname, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(106, 'Neha',   'Kulkarni', 'neha.k@gmail.com',       '9876543215', '2024-06-10', '1995-03-18'),
(107, 'Vikram', 'Singh',    NULL,                     '9876543216', '2024-07-01', '1994-07-07'),
(108, 'Anjali', NULL,       'anjali@outlook.com',     NULL,         '2024-08-14', '2001-09-12'),
(109, 'Rohan',  'Deshmukh', 'rohan.d@yahoo.com',      '9876543218', NULL,         '1993-02-25'),
(110, 'Pooja',  'Joshi',    'pooja@gmail.com',        '9876543219', '2024-09-30', NULL),
(111, 'Suresh', 'Patil',    NULL,                     NULL,         '2024-10-05', '1990-06-15'),
(112, 'Meera',  'Nair',     'meera.nair@gmail.com',   '9876543221', '2025-01-20', '1999-12-01'),
(113, 'Amit',   'Verma',    'amitv@rediffmail.com',   '9876543222', '2025-02-11', '1998-05-10'),
(115, 'Sanjay', 'Mehta',    'sanjay.m@gmail.com',     NULL,         '2025-04-09', '1988-10-28');

INSERT INTO customers (customerID, FirstName, email, Phone, AccountCreationDate, DateOfBirth) VALUES
(114, 'Kavita', 'kavita@gmail.com', '9876543223', '2025-03-03', '2002-04-17');

select * from customers;

INSERT INTO accounts (AccountID, AccountType, Balance, CustomerID, BranchID) VALUES
(1006, 'Savings', 32000.00,  106,  1),
(1007, 'Current', 150000.00, 107,  3),
(1008, 'Savings', NULL,      108,  2),
(1009, NULL,      5000.00,   109,  4),
(1010, 'Savings', 1000.00,   110,  4),
(1011, 'Current', 98000.00,  111,  5),
(1012, 'Savings', 12000.00,  112,  NULL),
(1013, 'Current', 27500.50,  101,  3),
(1014, 'Savings', 60000.00,  NULL, 1),
(1015, 'Savings', 8500.00,   113,  2);

select * from accounts;

INSERT INTO kyc (kyc_id, adhar_num, pan_num, customerid ) VALUES
(1, '234567890123', 'ABCPS1234A', 101),
(2, '345678901234', 'BCDPJ2345B', 102),
(3, '456789012345', 'CDEPV3456C', 103),
(4, '567890123456', 'DEFPJ4567D', 104),
(5, '678901234567', 'EFGPM5678E', 105),
(6, '789012345678', 'FGHPK6789F', 106),
(7, '890123456789', 'GHIPS7890G', 107),
(8, '901234567890', 'HIJPD8901H', 109),
(9, '112233445566', 'IJKPN9012I', 112);

select * from kyc;

INSERT INTO loans (LoanID, LoanAmount, InterestRate, StartDate, EndDate, CustomerID) VALUES
(504, 400000.00, 8.25, '2025-01-10', '2030-01-10', 105),
(505, 150000.00, NULL, '2025-02-01', '2027-02-01', 106),
(506, 900000.00, 7.50, '2025-03-05', NULL,         107),
(507, NULL,      9.50, '2025-04-01', '2029-04-01', 109),
(508, 300000.00, 8.50, '2025-05-15', '2030-05-15', 101),
(509, 120000.00, 10.00,'2025-06-01', '2026-06-01', NULL);

INSERT INTO transactions (TransactionID, TransactionDate, Ammount, TransationType, AccountID) VALUES
(6,  '2025-01-18', 1500.00,  'Deposit',    1005),
(7,  '2025-01-20', NULL,     'Deposit',    1006),
(8,  '2025-02-02', 4500.00,  'Withdrawal', 1006),
(9,  '2025-02-05', 20000.00, 'Deposit',    1007),
(10, '2025-02-10', 2500.00,  NULL,         1007),
(11, '2025-02-14', 800.00,   'Transfer',   1001),
(12, '2025-02-20', 12000.00, 'Transfer',   1004),
(13, '2025-03-01', 6000.00,  'Deposit',    NULL),
(14, '2025-03-05', 3500.00,  'Withdrawal', 1010),
(15, NULL,         9000.00,  'Deposit',    1011),
(16, '2025-03-15', 500.00,   'Withdrawal', 1002),
(17, '2025-03-18', 15000.00, 'Deposit',    1013),
(18, '2025-04-01', 2200.00,  'Withdrawal', 1013),
(19, '2025-04-10', 7500.00,  'Deposit',    1001),
(20, '2025-04-12', 1000.00,  'Transfer',   1015);

select * from transactions;

-- distinct 
select distinct accounttype from accounts;

select distinct customerid from loans;

-- Limit clause
select * from transactions
limit 5;

select * from transactions;
order by Ammount desc
limit 3;

-- find top 2 from amount with withdrawal 
select * from transactions
where TransationType = 'withdrawal'
order by Ammount desc
limit 3;

-- Offset clause
select * from customers
limit 5 offset 5;

select * from loans
order by LoanAmount desc
limit 1 offset 2;

select * from customers;

-- Null
select customerid, firstname , lastname, email, phone from customers
where lastname is null or phone is null ;

select * from customers
where lastname is not null;

-- Case statements
select * from loans;

select loanid, loanamount, customerid,
case
when loanamount >= 500000 then "High value loan"
when loanamount >= 20000 then "Medium value loan"
else "Low value loan"
end as loancategory
from loans;

select * from transactions;

-- Categorize the deposits in the transactions table as per conditions given
-- if above 10000(include) High amount
-- if upto 5000(include) to 10000 Medium amount
--  if upto 5000 low amount
-- for transaction type withdrawal "not applicalble"

select TransactionID, Ammount, TransationType,
case
    when TransationType = 'Deposit' and Ammount >= 10000 then 'High amount'
    when TransationType = 'Deposit' and Ammount >= 5000 then 'Medium amount'
    when TransationType = 'Deposit' and Ammount >= 0 then 'Low amount'
    else 'Not Applicable'
end as DepositCategory
from transactions;

-- String Function
-- upper () function 
 select upper("hello");
 
 select upper(firstname) As FirstName, Phone, email from customers;  

-- Lower () function
select lower(firstname) As FirstName, lower(lastname) LastName from customers;

-- length () function
select length("Nagpur") As "NoOfCharacters"; -- gives o/p in number of bytes
select length("नागपूर");-- gives o/p in number if bytes
select char_length("NAGPUR");-- gives o/p in number of characters
select char_length("नागपूर");-- gives o/p in number of characters

-- Concat () functions
select concat("Hello", " " "World") as Concatfunctionstring;
select concat(firstname, " ", lastname) as fullname, phone, email
from customers;

-- Substring() or substr() function
select substr("Hello World India",7, 5) as extractedstring;

select * from customers;
select concat(substr(firstname, 1, 1), ' ', lastname) as name
from customers;

select customerid, concat(substr(firstname,1,1),".",lastname) as fullname, phone, email from customers;

-- Trim function
select length("Hello World");
select length(trim("    Hello World    "));
select length(trim(substring("Hello World",6)));

-- Replace() Function
select replace("Mat mat Mat","M","C");

-- Mathematical Functions
-- Round function
select * from accounts;
select avg(balance) from accounts
where accounttype = "Savings";

select round(avg(balance),2) as AvgBalance from accounts
where accounttype = "Savings";

select round(3.6);
select round(3.3);
select round(3.5);

-- Ceil() or Ceiling() function
select ceiling(avg(Balance)) from accounts
where accounttype = "Savings";

-- Floor() function
select floor(avg(Balance)) from accounts
where accounttype = "Savings";

-- Absolute() function.....It removes the sign
select abs(-3656);
select abs(-1.34);
select abs(6.464);

-- Mod() function
select (7/3);
select mod(7,3);

-- Power()
select power(2,3);
select power(1.5,3);

-- SQRT()
select sqrt(123);
select sqrt(144);  

-- Date Function
select * from customers;
select now();
select current_date();
select curdate();

select year(dateofbirth),month(dateofbirth),day(dateofbirth) from customers;

select customerid,FirstName,dateofbirth,
year(dateofbirth),month(dateofbirth),day(dateofbirth)
from customers where customerid = 104;

select customerid,FirstName,dateofbirth,
year(curdate()) - year(dateofbirth) as age
from customers;

select * from customers;

select firstname, dateofbirth, datediff(curdate(),dateofbirth)
from customers;

select firstname, dateofbirth, round(datediff(curdate(),dateofbirth) / 365, 1) as age
from customers;

select firstname, dateofbirth,
       concat(firstname, " age is ", round(datediff(curdate(), dateofbirth) / 365, 1)) as age
       
from customers;select firstname, dateofbirth,
        round(datediff(curdate(), dateofbirth) / 365, 1) as age
from customers;

select concat(firstname," ",lastname) as fullname,
accountcreationdate,
date_add(accountcreationdate, interval 1 year) as KYCRenewal
from customers;

UPDATE customers SET DateofBirth = '1998-05-10', AccountCreationDate = '2024-01-15' WHERE customerID = 101;
UPDATE customers SET DateofBirth = '2000-01-05', AccountCreationDate = '2024-04-18' WHERE customerID = 104;
UPDATE customers SET DateofBirth = '1996-12-30', AccountCreationDate = '2024-05-25' WHERE customerID = 105;

select date_sub(curdate(), interval 7 day);

UPDATE customers c
JOIN (SELECT customerID, DateofBirth AS dob, AccountCreationDate AS acd
      FROM customers
      WHERE customerID IN (101,104,105)) t
  ON c.customerID = t.customerID
SET c.DateofBirth = t.acd,
    c.AccountCreationDate = t.dob;
    
-- Aggregrate Function

-- Calculate the total balance maintained across all customer accounts
select sum(balance) totalBalance from accounts;

-- Calculate the Average balance maintained across all customer account
select avg(balance) AverageBalance from accounts;

-- Identify the highest balance maintained in any customer account
select max(balance) as highest_balance
from accounts;

-- Determine the total number of customer accounts available in the system.
select count(*) as NoofAccounts from accounts;

select * from accounts;

-- Group By 
SELECT 
    accounttype, COUNT(*) as NoOfAccounts
FROM
    accounts
GROUP BY accounttype;

SELECT 
    accounttype, sum(balance) as NoOfAccounts
FROM
    accounts
GROUP BY accounttype;

-- Find total amount by transaction type 
select TransationType, sum(Ammount) as TotalAmount
from transactions
group by TransationType;

select customerID, firstname, DateofBirth, AccountCreationDate
from customers
where customerID = 105;

update customers
set DateofBirth = '1996-12-30',
    AccountCreationDate = '2024-05-25'
where customerID = 105;

select customerID, firstname, DateofBirth, AccountCreationDate
from customers
where customerID in (101, 104, 105);

ALTER TABLE transactions RENAME COLUMN TransationType TO TransactionType;
ALTER TABLE transactions RENAME COLUMN Ammount TO Amount;
ALTER TABLE kyc RENAME COLUMN Adhar_num TO Aadhaar_num;

-- Find total accounts for branch and accounttype.
select * from accounts;

select AccountType, BranchID, count(*) as NoofAccounts
from accounts
group by AccountType, BranchID
order by NoofAccounts desc;

-- HAVING Clause
-- Find Transaction type where total amount for that transaction type exceeds 20000.
 select TransactionType, sum(Amount) as TotalAmount
from transactions
group by TransactionType
having TotalAmount > 20000;

select TransactionType, sum(Amount) as TotalAmount
from transactions
group by TransactionType
having TotalAmount > 20000 and TransactionType = 'Deposit';

-- Find number for customers for according to year from customers table 
select * from customers;

select year(accountcreationdate) as years, count(*) as totalCustomers
from customers
group by years
order by totalcustomers desc;

-- Find total loan amount for all the customers.
select * from loans;

select CustomerID, sum(LoanAmount) as TotalLoanAmount
from loans
group by CustomerID
order by CustomerID;

-- Display distinct BranchIDs from Accounts where balance is greater than rupees 30000.
select * from accounts;

select branchid, balance
from accounts
where balance > 30000
order by BranchID;

-- Display all savings accounts belonging to branch 1 or branch 3. 
select * from accounts
where BranchID = 1 or BranchID = 3
and AccountType = 'Savings';


