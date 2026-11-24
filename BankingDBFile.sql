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

alter table loans change Enddate EndDate date;

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

select * from transactions
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

select date_sub(curdate(), interval 7 day);
    
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
select TransactionType, sum(Amount) as TotalAmount
from transactions
group by TransactionType;

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

-- Find the average balance of current accounts for each branch displays only banches where the average balance exceeds rupess 40000

select branchid,accounttype, avg(balance) as avgBalance from accounts
where accounttype = "Current"
group by branchid;

select * from customers;
select * from accounts;
select * from loans;

-- Joins
-- A Join combines related rows from different tables based on a common column

-- 1. Inner Join
-- Matches rows that exists in both tables.

-- Find all customers who have accounts and show their balance.
SELECT 
    c.customerID,
    c.firstname,
    c.lastname,
    a.accounttype,
    a.balance
FROM
    customers c
        INNER JOIN
    accounts a ON c.customerID = a.CustomerID;
    
SELECT 
    *
FROM
    customers c
        INNER JOIN
    accounts a ON c.customerID = a.CustomerID;
    
-- Find all the customer who have loans output should contain customerid,firstname, lastname,phone, loanamount 
select c.customerID, c.firstname, c.lastname, c.phone, l.LoanAmount
from customers c
inner join loans l on c.customerID = l.CustomerID;

select c.customerID, c.firstname, c.lastname, c.phone, l.LoanAmount
from customers c
join loans l # By default mysql uses inner join if join type is not mentioned
on c.customerID = l.CustomerID;

UPDATE customers SET DateofBirth = '1998-05-10', AccountCreationDate = '2024-01-15' WHERE customerID = 101;
UPDATE customers SET DateofBirth = '2000-01-05', AccountCreationDate = '2024-04-18' WHERE customerID = 104;
UPDATE customers SET DateofBirth = '1996-12-30', AccountCreationDate = '2024-05-25' WHERE customerID = 105;

UPDATE customers c
JOIN (SELECT customerID, DateofBirth AS dob, AccountCreationDate AS acd
      FROM customers
      WHERE customerID IN (101,104,105)) t
  ON c.customerID = t.customerID
SET c.DateofBirth = t.acd,
    c.AccountCreationDate = t.dob;
    
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
ALTER TABLE kyc RENAME COLUMN Adhar_num TO Aadhaar_num;
ALTER TABLE transactions RENAME COLUMN Ammount TO Amount;

select *  from branches;

-- get CustomerID, customer name, account type, balance, branch name for realated tables 
select c.customerID,
       concat_ws(' ', c.firstname, c.lastname) as CustomerName,
       a.AccountType,
       a.balance,
       b.BranchName
from customers c
join accounts a on c.customerID = a.CustomerID
join branches b on a.BranchID = b.BranchID
order by c.customerID;

-- Find the number of accounts held by each customers
-- Left Join
-- Returns all rows from the left table, and matched rows from the right
-- Get data for all customers and show their balance
select c.CustomerID, C.firstname, c.lastname, a.accounttype, a.balance
from customers c
left join accounts a
on c.customerID = a.CustomerID;

-- Find cusotmers who are registered but dont have account
select c.CustomerID, C.firstname, c.lastname, a.accounttype, a.balance
from customers c
left join accounts a
on c.customerID = a.CustomerID
where a.accounttype is Null and a.balance is Null;

-- Right Join
select c.CustomerID, C.firstname, c.lastname, a.accounttype, a.balance
from customers c
right join accounts a
on c.customerID = a.CustomerID;

-- Full outer join
select * from customers c
left join accounts a
on c.customerID = a.CustomerID
union
select * from customers c
right join accounts a
on c.CustomerID = a.CustomerId;

-- Cross Join 
select * from customers c
cross join accounts a;

-- Find the number of accounts held by each customers
select c.customerID,
       concat_ws(' ', c.firstname, c.lastname) as CustomerName,
       count(a.AccountID) as NoOfAccounts
from customers c
left join accounts a on c.customerID = a.CustomerID
group by c.customerID, c.firstname, c.lastname
order by c.customerID;

select c.customerID, c.firstname, c.lastname, count(a.accounttype) as NoOfAccounts
from customers c
left join accounts a on c.customerID = a.CustomerID
group by c.customerID;

-- Find the numbers of customers for each accounts type. 
select a.AccountType, count(a.customerID) as NoOfCustomers
from accounts a
left join customers c on a.CustomerID = c.customerID
group by a.AccountType;

select accounttype, count(*)
from accounts
group by accounttype;

-- Find customers who have more than one accounts
select c.customerID, c.firstname, c.lastname, count(a.accounttype) as NoOfAccounts
from customers c
left join accounts a on c.customerID = a.CustomerID
group by c.customerID
having NoofAccounts > 1;

-- Find the customers who have never performed a transaction.
SELECT 
    c.customerID,
    c.firstname,
    c.lastname,
    a.accountid,
    t.TransactionID
FROM
    customers c
        JOIN
    accounts a ON c.customerID = a.CustomerID
        LEFT JOIN
    transactions t ON a.AccountID = t.AccountID
WHERE
    t.TransactionID IS NULL;
    
    -- Self Join
-- Not a keyword - just a regular join where a table is joined to itself, using two aliases. perfect for hierarchies: here, matching each employee to their manager who is also an employee.
create table Employees (
  EmployeeID INT primary key,
  EmployeeName varchar(50) not null,
  ManagerID int,
  Department varchar(50),
  Salary decimal(10,2),
  JoiningDate date,
  BranchID int,
  foreign key (ManagerID)
  references Employees(EmployeeID),
  foreign key (BranchID)
  references Branches(BranchID)
  );
  desc employees;
  
  select * from employees;
INSERT INTO Employees
    (EmployeeID, EmployeeName, ManagerID, Department, Salary, JoiningDate, BranchID)
VALUES
    (1, 'Rajesh Sharma', NULL, 'Management', 120000.00, '2018-04-15', 1),
    (2, 'Priya Patel', 1, 'Human Resources', 75000.00, '2019-06-10', 2),
    (3, 'Amit Kumar', 1, 'Finance', 82000.00, '2020-01-20', 3),
    (4, 'Sneha Verma', 1, 'IT', 95000.00, '2019-09-05', 4),
    (5, 'Rahul Singh', 1, 'Sales', 78000.00, '2021-03-12', 5),

    (6, 'Neha Joshi', 2, 'Human Resources', 55000.00, '2021-07-19', 1),
    (7, 'Vikas Gupta', 2, 'Human Resources', 52000.00, '2022-02-14', 2),
    (8, 'Pooja Mehta', 3, 'Finance', 60000.00, '2021-11-08', 3),
    (9, 'Suresh Yadav', 3, 'Finance', 58000.00, '2022-05-16', 4),
    (10, 'Anjali Deshmukh', 4, 'IT', 72000.00, '2020-08-24', 5),

    (11, 'Rohan Kulkarni', 4, 'IT', 68000.00, '2021-10-11', 1),
    (12, 'Kavita Rao', 4, 'IT', 65000.00, '2022-01-17', 2),
    (13, 'Arjun Malhotra', 5, 'Sales', 57000.00, '2022-06-20', 3),
    (14, 'Meena Shah', 5, 'Sales', 59000.00, '2021-12-06', 4),
    (15, 'Deepak Thakur', 5, 'Sales', 54000.00, '2023-01-09', 5),

    (16, 'Nitin Pawar', 6, 'Human Resources', 42000.00, '2023-04-18', 1),
    (17, 'Swati Mishra', 7, 'Human Resources', 40000.00, '2023-07-03', 2),
    (18, 'Manish Jain', 8, 'Finance', 45000.00, '2023-02-27', 3),
    (19, 'Komal Sinha', 9, 'Finance', 43000.00, '2023-08-14', 4),
    (20, 'Akash Bansal', 10, 'IT', 50000.00, '2023-05-22', 5);
    

SELECT e.EmployeeID, e.EmployeeName as EmployeeName, m.EmployeeName as ManagerName
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID;

-- Include branch name also
SELECT e.EmployeeID, e.EmployeeName as EmployeeName, m.EmployeeName as ManagerName,
b.branchname
FROM Employees e
LEFT JOIN Employees m
ON e.ManagerID = m.EmployeeID
join branches b
on e.branchid = b.branchid
order by e.EmployeeID;

-- Find the all the employees who report to sneha verma 
SELECT e.EmployeeID,
       e.EmployeeName AS EmployeeName,
       m.EmployeeName AS ManagerName
FROM Employees e
JOIN Employees m
  ON e.ManagerID = m.EmployeeID
JOIN Branches b
  ON e.BranchID = b.BranchID
WHERE m.EmployeeName = 'Sneha Verma'
ORDER BY e.EmployeeID;

-- find Employee who does not have any manager
SELECT e.EmployeeID,
       e.EmployeeName AS EmployeeName,
       m.EmployeeName AS ManagerName
FROM Employees e
LEFT JOIN Employees m
  ON e.ManagerID = m.EmployeeID
where m.employeename is null;

-- Subqueries
-- Find all customers having balance more than the average balance
select * from accounts;
select avg(balance) from accounts;
SELECT customerid, balance, accounttype from accounts
where balance >40642;

select accountid, customerid, balance, accounttype
from accounts
where balance >(
select avg(balance) from accounts
);

-- Find all customers having balance more than the average balance in the savings account
select avg(balance) from accounts
where accounttype="Savings";

SELECT c.firstname, a.balance
FROM Customers c
JOIN Accounts a
  ON c.CustomerID = a.CustomerID
WHERE a.AccountType = 'Savings';
  
-- Scalar Subquery
--  A scalar subquery returns exactly on row and one colume
select * from accounts;
select customerid, accountid, accounttype, balance
from accounts
where balance > (select avg(balance) from accounts where accounttype = "Savings")
&& AccountType = "Savings";

-- Find the account(S) having the highest balance.
select customerid, accounttype, balance
from accounts
where balance = (select max(balance) from accounts);

-- Find customers whose year of birth is earlier than the average year of birth of all customers.
select customerID, firstname, lastname, DateofBirth
from customers
where year(DateofBirth) < (select avg(year(DateofBirth)) from customers);

-- Multiple Row suquery
-- A multiple row subqery returns more than one row, usually a single column.

-- Find all customers who have taken at least one loan
select c.customerID, c.firstname, c.lastname, l.loanamount
from customers c
inner join loans l on c.customerID = l.CustomerID;

select customerID, firstname, lastname
from customers
where customerID in (select CustomerID from loans);

-- find all customers who have at least one savings account 
SELECT 
    customerID, firstname, lastname
FROM
    customers
WHERE
    customerID IN (SELECT 
            CustomerID
        FROM
            accounts
        WHERE
            AccountType = 'Savings');
            
select * from accounts;
-- update customer id to 114 where
update accounts set customerid = 114
where accountid = 1014;

-- update account type of account id 1009 to current 
update accounts
set AccountType = 'Current'
where AccountID = 1009;

-- update balance to 0 for account id 1008
update accounts
set balance = 1100
where AccountID = 1008;

-- update branchid to 5 for accountid 1012
update accounts
set BranchID = 5
where AccountID = 1012;

select * from branches;
select * from customers;

-- add account creation date for customerid 109
update customers
set AccountCreationDate = '2025-02-20'
where customerID = 109;

select * from loans;
update loans set loanamount = 200000
where loanid = 507;

update loans set customerid = 104
where loanid = 509;

select * from transactions;
update transactions set amount = 6500
where transactionid = 7;

update transactions set transactiontype = 'Withdrawal'
where transactionid = 10;

update transactions set accountid = 1006
where transactionid = 13;

-- find all customers who have an account in branchid = 1
select customerID, firstname, lastname
from customers
where customerID in (select CustomerID from accounts where BranchID = 1);


