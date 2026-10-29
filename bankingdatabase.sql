create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
    
);


alter table customers
ADD CONSTRAINT pk_customer_id PRIMARY KEY (customerID);

desc customers;

SELECT * from customers;

ALTER table  customers
ADD AccountCreationDate Date;

desc customers;

CREATE TABLE Accounts (
        Account INT,
        AccountType varchar(20),
        Balance decimal(10,2)
);

alter table accounts
ADD CONSTRAINT pk_account_id PRIMARY KEY (account);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

alter table transactions
ADD CONSTRAINT pk_transaction_id PRIMARY KEY (transactionID);

desc Transactions;

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);
desc Branches;

alter table branches
ADD CONSTRAINT pk_branch_id PRIMARY KEY (branchID);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

desc accountbranches;

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);
desc loans;

alter table loans
ADD CONSTRAINT pk_loan_id PRIMARY KEY (loanID);

desc customers;