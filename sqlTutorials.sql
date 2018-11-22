print("(----- SQL TUTORIALS -----)")

# SELECT STATEMENT

SELECT CustomerName, City FROM Customers;

# select all columns from customer table
SELECT * FROM Customers;

# SELECT DISTINCT STATEMENT
SELECT Country FROM Customers;

# select only the DISTINCT values from the "Country" column in the "Customers" table
SELECT DISTINCT Country FROM Customers;

# list the number of different (distinct) customer countries:
SELECT COUNT (DISTINCT Country) FROM Customers;

# Here is the workaround for MS Access;
SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);

# SQL WHERE
# Select all the customers from the country "Mexico", in the "Customers" table
SELECT * FROM Customers
WHERE Country="Mexico";

#Text Field Vs Numeric Fields
SELECT * FROM Customers
WHERE CustomerID=1;

# AND, OR, AND NOT OPERATORS
# and
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

# or
SELECT * FROM Customers
WHERE City='Berlin' OR City='Munchen';

# not
SELECT * FROM Customers
WHERE NOT Country='Germany';

# Combining and, or and not
SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='Munchen');

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

# SQL ORDER BY
SELECT * FROM Customers
ORDER BY Country;

# Order by Desc
SELECT * FROM Customers
ORDER BY Country DESC;

# Order by Several Columns Example
SELECT * FROM Customers
ORDER BY Country, CustomerName;

# Order By Several Columns Example 2
SELECT * FROM Customers
ORDER BY COUNTRY ASC, CustomerName DESC;

# SQL INSERT INTO STATEMENT
# insert into example
INSERT INTO Customers (CustomerName, CustomerName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen S1', 'Stavanger', '4006', 'Norway');

# Insert Data Only In Specified Columns
INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

# SQL NULL VALUES STATEMENT
# a field with a NULL value is a field with no value.

SELECT LastName, FirstName, Address FROM Persons
WHERE Address IS NULL;

# The is NOT NULL
SELECT LastName, firstName, Address FROM Persons
WHERE Address IS NOT NULL;

# SQL UPDATE STATEMENT
# update statement is used to modify the existing records in a table

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City = 'Frankfurt'
WHERE CustomerID = 1;

# Update Multiple Records
UPDATE Customers
SET ContatctName = 'Juan'
WHERE country = 'Mexico';

# Update Warning
# be careful when updating records. if you omit the WHERE clause, ALL records will be updated!
UPDATE Customers
SET ContactName='Juan';

# SQL DELETE STATEMENT
DELETE FROM Customers
WHERE CustomerName='Alfreds Futterkiste';

# Delete All Records
DELETE FROM Customers;

# SQL TOP, LIMIT OR ROWNUM
# Sql Server / MS Access
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

# MySQL
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

# Oracle
SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= numbers;

# SQL TOP, LIMIT and ROWNUM
SELECT TOP 3 * FROM Customers;

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
WHERE ROWNUM <= 3;

# sql top percent
SELECT TOP 50 PERCENT * FROM Customers;

# Add a where caluse
SELECT TOP 3 * FROM Customers
WHERE Country='Germany';

SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

SELECT * FROM Customers
WHERE Country='Germany' AND ROWNUM <= 3;

# SQL MIN() AND MAX() FUNCTIONS
# the min function returns the smallest value of the selected column_name.
# the max function returns the largest value of the selected column.

# min()
SELECT MIN(Price) AS SmallestPrice
FROM Products;

# max()
SELECT MAX(Price) AS LargestPrice
FROM Products;


# SQL COUNT(), AVG(), AND SUM() FUNCTIONS
# The count() function returns the number of rows that matches a specified criteria
# The avg() function returns the averge value of a numeric column.
# The sum() function returns the total sum of a numeric column


SELECT COUNT(ProductID)
FROM Products;

SELECT AVG(Price)
FROM Customers;

SELECT SUM(Quantity)
FROM OrderDetails;

# SQL LIKE OPERATOR
'''
LIKE Operator                             Description
WHERE CustomerName LIKE 'a%'              Finds any values that start with "a"
WHERE CustomerName LIKE '%a'              Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'            Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'             Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%_%'           Finds any values that start with "a" and are at least 3 character in length
WHERE ContactName LIKE 'a%o'              Finds any values that start with "a" and ends with "o"
'''

# SQL LIKE
# customername starting with "a"
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

# customername ending with "a"
SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

# customername that have "or" in any position
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

# customername that have "r" in the second position
SELECT * from Customers
WHERE CustomerName LIKE '_r%';

# customername that starts with "a" and are at least 3 character in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a_%_%';

# customername that starts with "a" and ends with "o"
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';

# customername that does NOT start with "a"
SELECT * Customers
WHERE CustomerName NOT LIKE 'a%'

# SQL WILDCARS
# a wildcard character is used to substitute any other character(s) in a string

# Using the % Wildcard
# customers with a city starting with "ber"
SELECT * FROM Customers
WHERE City LIKE 'ber%';

# customer with a city containing the pattern "es"
SELECT * FROM Customers
WHERE City LIKE '%es%';

# Using the _ Wildcard
# customers with a city starting with any any character, following by "erlin"
SELECT * FROM Customers
WHERE City LIKE '_erlin';

# Customers with city starting with "L" followed by any character, followed by "n" followed by any character followed by "on"
SELECT * FROM Customers
WHERE City LIKE 'L_n_on';

# Using The [charlist] Wildcard
# customers with a city starting with "b", "s", or "p"
SELECT * FROM Customers
WHERE City LIKE '[a-c]%c';

# Using the [!charlist] wildcard
# customers with a city NOT starting with "b", "s", or "p"
SELECT * FROM Customers
WHERE City LIKE '[!bsp]%';

SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';

# IN OPERATOR STATEMENT

# select all customers that are located in germany, france, uk
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

# Select all customers that are NOT located in Germany, france, uk
SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

#select all customers that are from the same countries aas the suppliers
SELECT * FROM Customers
WHERE Country IN (SELECT country FROM Suppliers);

# BETWEEN OPERATOR
# select all products with a price between 10 and 20;
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

# not between example
SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

# betweeen with IN Example
SELECT * FROM Products
WHERE (Price BETWEEN 10 AND 20)
AND NOT CategoryID IN (1,2,3);

# Between Text Values Example
SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

# not between text vakues example
SELECT * FROM Products
WHERE ProductName NOT BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

# between Dates
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'


# SQL ALIASES
# create two aliases, one for the customerID column and one for the customerName column
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

# create two aliases, one for the custmerName column and one for the
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

# create an alias named "Address" that combine four column
SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' +
Country AS Address
FROM Customers;

# Statemet above to work in MYSQL use the following:
SELECT CustomerName, CONCAT(Address, ', ',PostalCode, ', ', City,',', Country) AS Address
FROM Customers;

# Alias For Table Example
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around The Hord" AND c.CustomerID=o.CustomerID;

# without aliases
SELECT Orders.OrderID, Orders.Date, Customers.CustomerName
FROM Customer, Orders
WHERE Customers.CustomerName="Around The Horn" AND
Customers.CustomerID=Orders.CustomerID

# SQL JOINS
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

'''
+ (INNER) JOIN: Returns records that have matching values in both tables
+ LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
+ RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
+ FULL (OUTER) JOIN: Return all records when there is a match in either left or right table

'''

# SQL INNNER JOIN KEYWORD
# select all orders with customer informations:
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

# join three Table
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders))
INNER JOIN Customers ON orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

# SQL LEFT JOIN KEYWORD
# The left join keyword returns all records from the left table(table1), and the macthed records from the right table(table2). The result is Null from the left right side, if there is no match

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


# SQL RIGHT JOIN KEYWORD
'''
The right JOIN keyword returns all records from the right table (table2), and the matched records from
the left table(table1). The result is NULL from the left side, when there is no match.
'''

SELECT Orders.OrderID, Employee.LastName, Employees.firstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmpployeeID = Employees.EmpployeeID
ORDER BY Orders.OrderID;

# SQL FULL OUTER JOIN KEYWORD
'''
The FULL OUTER JOIN keyword return all records when there is a match in either left (table1) or right (table2) table records

Note: Full outer join can potenially return very large result-sets!

'''

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

# SELF SELF JOIN
'''
A self JOIN is a regular join, but the table is joined with itself.
'''

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS
CustomerName2, A.City
FROM Customers A, Customer B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

# SQL UNION OPERATOR
'''
The UNION Operator is used to combine the result-set of two or more SELECT statement

* each select statement within Union must have the same number of columns
* the columns must also have similar data types
* the columns in each SELECT statement must also be in the same order

'''

# Union
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

# Union All
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;


# UNION With where
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

# Another Union
SELECT 'Customers' As Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;

# SQL GROUP BY STATEMENT
# The GROUP By Statament is often used with aggregate functions(COUNT, MAX, MIN, SUM, AVG) to group the result-set by one or more columnns.

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;


# the following SQL Statement lists the number of customers in each country, stored high or low:
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID), DESC;

# Group By Wth JOIN
SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

# HAVING CLAUSE
# The Having clause was added to SQL because the WHERE keyword could not be used with agrregate functions.

# SQL Having Examples
# following sql statement lists the number of customers in each country. only include countries with more than 5 customers
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

# the following sql statement lists the number of customers in each country, sorting high low (only include conntries with more than 5 countries)
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

# More Having
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmpployeeID = Employees.EmpployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;

# list employees "davolio"
SELECT Employee.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmpployeeID = Employee.EmpployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

# SQL EXISTS
# The exists operator is used to test for the existence of any record in a subquery.
# The exists operator returns true if the subquery returns one or more records

# EXISTS
# product price less than 20
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierID = Suppliers.supplierID AND Price < 20);


# product price equal to 22
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierID = Suppliers.supplierID AND Price = 22);

# ANY AND ALL OPERATORS
'''
The ANY and ALL operators are used with a WHERE or HAVING clause
ANY operator returns true if any of the subquery values meet the condition
ALL operator returns true if all of the subquery values meet the condition.

'''

# Any
SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 99);

# all
SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

# SELECT INTO Statement
# creates a backup copy of Customers
SELECT * INTO CustomersBackup2017
FROM Customers;

# use in IN clause to copy the table into a new table in another database
SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers

# copies only a few columns into a new table
SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;

# copies only the german customers into a new table
SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany'

# data from more than one table into a new table
SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

# tips
SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;


# SQL INSERT INTO SELECT
'''
The INSERT INTO SELECT statement copies data from one table and inserts it into another table
* INSERT INTO SELECT requires that data types in source and target tables match
* The existing records in the target table are unaffected

'''

# INSERT INTO SELECT
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

# Suppliers into customers (fill all columns)
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;


# copies only the german suppliers into customers
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany'

# CASE STATEMENT
'''
The case statement goes through conditions and return a value when the first condition is met(Like an IF-THEN-ELSE Statement)
So, once a condition is true, it will stop reading and return the result. if no conditions are true, ut returns the value in the ELSE clause.

'''

# CASE
# goes through conditions and returns a value when the first condition is met
SELECT OrderID, Quantity,
CASE
  WHEN Quantity > 30 THEN "The quantity is greater than 30"
  WHEN Quantity = 30 THEN "The quantity is 30"
  ELSE "The quantity is under 30"
END
FROM OrderDetails;

# will order the customers by City, However if City is NULL, then order by Country
SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);


# NULL FUNCTIONS : IFNULL(), ISNULL(), COALESCE(), AND NVL() FUNCTIONS
# the mysql ifnull() function lets you return an alternative value if an expression us NULL
SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)
FROM Products;

# MySQL
SELECT ProductName, UnitPrice * (UnitsInStock + IFNULL(UnitsOnOrder, 0))
FROM Products

# we can use the COALESCE()
SELECT ProductName, UnitPrice * (UnitsInStock + COALESCE(UnitsOnOrder, 0))
FROM Products

# SQL Server
# Server ISNULL()
SELECT ProductName, UnitPrice * (UnitsInStock + INSULL(UnitsOnOrder, 0))
FROM Products

# MS Access
# access IsNull()
SELECT ProductName, UnitPrice * (UnitsInStock + IIF(IsNull(UnitsOnOrder), 0, UnitsOnOrder))
FROM Products

# Oracle
# orcake NVL
SELECT ProductName, UnitPrice * (UnitsInStock + NVL(UnitsOnOrder, 0))
FROM Products

# STORED PROCEDURES FOR SQL SERVER
'''
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

'''

# Stored Procedure
# statement creates a stored procedure named "SelectAllCustomers" that selects all records from the "customers" table
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

# execute the stored procedure above as follows:
EXEC SelectAllCustomers;

# Stored Procedure with One Paramater
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

# execute the stored procedure
EXEC SelectAllCustomers City = "London";

# Store Procedure with Multiple Parameters
CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City and PostalCode = @PostalCode
GO;

# execute the stored procedure above as follows:
EXEC SelectAllCustomers City = "London", PostalCode = "WA1 1DP";

# SQL COMMENTS
# single line comment
--Select all:
SELECT * FROM Customers

SELECT * FROM Customers --WHERE City='Berlin';

--SELECT * FROM Customers
SELECT * FROM Products

# multi-line Comments
/*Select all the columns
of all the records
in the Customers table:*/


/*SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM Categories;*/
SELECT * FROM Suppliers;


SELECT CustomerName, /*City,*/ Country FROM Customers;


SELECT * FROM Customers WHERE (CustomerName LIKE 'L%'
OR CustomerName LIKE 'R%' /*OR CustomerName LIKE 'S%'
OR CustomerName LIKE 'T%'*/ OR CustomerName LIKE 'W%')
AND Country='USA'
ORDER BY CustomerName;




print("(----- SQL DATABASE -----)")
# CREATE DATABASE
# The CREATE DATABASE statement is used to create a new SQL Database
# the following SQL statement creates a database called "testDB"
CREATE DATABASE testDB;

# DROP DATABASE
# The following SQL statement drops the existing database "testDB"

DROP DATABASE testDB;

# CREATE TABLE
# create a table called "Person" that contains five columns: PersonID, LastName, FirstName, Address, and City
CREATE TABLE Persons (

  PersonID, int,
  LastName varchar(255),
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255)

);

# Create Table Using Another Table
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

# DROP TABLE
# drop table is used to drop an existing table in a database.
DROP TABLE Shippers;

# ALTER TABLE
# Alter table statement is used to add, delete or modify columns in an existing table.
# Alter table statement is also used to add and drop various constraits on an existing table
ALTER TABLE Customers
ADD Email varchar(255);

# following SQL deletes the "Email" column from the Customers table
ALTER TABLE Customers
DROP COLUMN Email;

# Alter Table
ALTER TABLE Person
ADD DataOfBirth date;

# Change Data Type
ALTER TABLE Persons
ALTER COLUMN DateOfBirth year;

# Drop Column
ALTER TABLE Persons
DROP COLUMN DateOfBirth;

# CREATE CONSTRAINTS
# constraints can be specified when the table is created with the create table statement, or after the table is created with the alter table statmenet
'''
SQL Constaraints
NOT NUL - Ensures that a column cannot have a NULL Value
UNIQUE - Ensure that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREING KEY - Uniquely identifies a row/record in another table
CHECK - Ensure that all values in a column satisfies a specific condition
DEFAULT - Sets a defualt value for a column when no value in specified
INDEX - Used to create and retrieve data from the database very quickly
'''

# NOT NUL CONSTRAINT
# by default, a column can hold NULL Values
# the NULL constrains enforce a column to NOT accept NULL Values
# NOT NULL on CREATE TABLE
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255) NOT NULL,
  Age int
);


# to create a NOT NULL Constraint on the "Age" column when the "Person" table is already created, use the following SQL
ALTER TABLE Persons
MODIFY Age int NOT NULL;


# SQL UNIQUE CONSTRAINT
'''
The UNIQUE constraint ensures that all values in a column are different.
Both the UNIQUE and PRIMARY KEY constraints provide a guarantee for uniqueness for a column or set of columns
A PRIMARY KEY constraint automatically has a UNIQUE Constraint.
However, you can have many UNIQUE constraints per table, but only one PRIMARY KEY constraint per table.
'''


# Unique constraint on create table
# sql server /oracle / ms acccess

CREATE TABLE Persons (
  ID int NOT NULL UNIQUE,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int
);

# MYSQL:
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  UNIQUE (ID)
);


# to name a UNIQUE constraint, and to define a UNIQUE constrains on multiple columns, use the following SQL syntax:
# MySQL / SQL Server / Oracle / MS Access
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  CONSTRAINT UC_Person UNIQUE (ID, LastName)
);


# sql Unique CONSTRAINT on ALTER TABLE
# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD UNIQUE (ID);

# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID, LastName);

# drop a UNIQUE Constraint
# mysql
ALTER TABLE Persons
DROP INDEX UC_Person;

# SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

# SQL PRIMARY KEY CONSTRAINT
'''
The primary key constraint uniquely identifies each record in a table
primary keys must contain unique values, and cannot contrain NULL values.
a table can have only one primary key, which may consist of single or multiple fields
'''

# primary key on create table
# the following SQL creates a primary key on the ID

# MySQL
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  PRIMARY KEY (ID)
);

# SQL Server / Oracle / MS Access
CREATE TABLE Persons (
  ID int NOT NULL PRIMARY KEY,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int
);

# MySQL / SQL Server / Oracle / MS Access
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);


# sql primary key on ALTER TABLE
# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD PRIMARY KEY (ID);

# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

# Drop a primary key constraint
# MySQ
ALTER TABLE Persons
DROP PRIMARY KEY;

#  SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;



# FOREIGN KEY CONSTRAINT
'''
A foreign key is a key used to link two tables together
A foreing key is a field or condition of field in one table that refers to the primary key in another table.
the table containing the foreign key is called the child table, and the table containing the candidate key is called the reference or parent table
look at the following table:

'''
# FOREIGN KEY ON CREATE TABLE
# the following SQL Creates a FOREIGN KEY on the PersonID column when the Orders table is created

# MySQL
CREATE TABLE Orders (
  OrderID int NOT NULL,
  OrderNumber int NOT NULL,
  PersonID int,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)

);

#  SQL Server / Oracle / MS Access
CREATE TABLE Orders (
  OrderID int NOT NULL PRIMARY KEY,
  OrderNumber int NOT NULL,
  PersonID int FOREING KEY REFERENCES Persons(PersonID)
);

# to allow naming of a FOREING KEY Constraint, and for defining a FOREING KEY constaint on multiple columns, use the following SQL syntax:
CREATE TABLE Orders (
  orderID int NOT NULL,
  OrderNumber int NOT NULL,
  PersonID int,
  PRIMARY KEY (OrderID),
  CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
  REFERENCES Persons(PersonID)
);

# FOREIGN KEY on Alter Table
# to create a foreign key contrain on the "PersonID" column when the "Orders" table is already created, using the following SQL
# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);


# Drop a Foreign key constrains
# MySQL
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

# SQL Server / Oracle / MS Access
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;


# CHECK CONSTRAINT
'''
The check constraint is used to limit the value range that can be placed in a column
If you define a check constraint on a single column it allows only certain values for this column
if you define a check constraint on a table it can limit the values in certain columns based on values in other columns in the row.

'''

# check on create table
# MySQL
CREATE TABLE Persons(
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  CHECK (Age>=18)
);
# SQL Server / Oracle / MS Access
CREATE TABLE Persons (

  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int CHECK (Age>=18)
);

# to allow naming of a check constraint, and for defining a check constraint on multiple columns use the following sql syntax
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  City varchar(255),
  CONSTRAINT CHK_Person CHECK (Age>=18) AND City='Sandness')
);

# check on Alter table
# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD CHECK (Age>=18);

# MySQL / SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandness');


# drop a check constraint
# SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

# MySQL
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;


# DEFAULT CONSTRAINT
'''
The default constraints is used to provide a default value for a column
The default value will be added to all new records IF no other value is specified.

'''

# Default on Create Table
# The following sql sets a default value for the "city" columns when the "persons" table is created:
# MySQL / SQL Server / Oracle / MS Access
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  City varchar(255) DEFAULT 'Sandnes'
);

# The Default constraint can also be used to insert system values by using functions like GETDATE():
CREATE TABLE Orders (
  ID int NOT NULL,
  OrderNumber int NOT NULL,
  OrderDate data DEFAULT GETDATE()
);

# Default on alter table
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

# SQL Server / Oracle / MS Access
ALTER TABLE Persons
ALTER COLUMN City SET DEFAULT 'Sandnes';

# Oracle
ALTER TABLE Persons
MODIFY City DEFAULT 'Sandnes';

# DROP a Default Constraint
ALTER TABLE Persons
ALTER City DROP DEFAULT;

# SQL Server / Oracle / MS Access
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

# CREATE INDEX STATEMENT
# Create index statement is used to create indexes in tables

CREATE INDEX idx_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

# Drop index statement
# MS Access
DROP INDEX index_name ON table_name;

# SQL Server
DROP INDEX table_name.index_name;

# Oracle
DROP INDEX index_name;

# MySQL
ALTER TABLE table_name
DROP INDEX index_name;

# AUTO INCREMENT FIELD
# auto-increment allows a unique number to be generated automatically when a new record is inserted into a table

# Syntax for MySQL
CREATE TABLE Persons(
  ID in NOT NULL AUTO_INCREMENT,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  PRIMARY KEY (ID)
);


# to let the AUTO_INCREMENT sequence start with another value, use the following SQL statememt
ALTER TABLE Persons AUTO_INCREMENT=100;

# to insert a new record into the person table, we will not have to specify a value for the ID column a unique value will added automatically
INSERT INTO Persons (FirstName, LastName)
VALUES ('Lars', 'Monsen')

# Syntax for sql Server
CREATE TABLE Persons (
  ID int IDENTITY(1, 1) PRIMARY KEY,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int
);

# to insert a new record into the Persons table we will NOT have to specify a value for the ID column a unique value will be added automatically
INSERT INTO Persons (FirstName, LastName)
VALUES ('Lars', 'Monsen');

# Syntax for access
CREATE TABLE Persons (
  ID integer PRIMARY KEY AUTOINCREMENT,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int
);

INSERT INTO Persons (FirstName, LastName)
VALUES ('Lars', 'Monsen');

# syntax for Oracle
CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO Persons (ID, FirstName, LastName)
VALUES (seq_person.nextval, 'Lars', 'Monsen');

# WORKING WITH DATES
'''
As long as your data contains only the date portion, your queries will work as expected. However, if a time portion is involved, it gets more complicated.

SQL Date Data Types
MySQL comes with the following data types for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: YYYY-MM-DD HH:MI:SS
YEAR - format YYYY or YY
SQL Server comes with the following data types for storing a date or a date/time value in the database:

DATE - format YYYY-MM-DD
DATETIME - format: YYYY-MM-DD HH:MI:SS
SMALLDATETIME - format: YYYY-MM-DD HH:MI:SS
TIMESTAMP - format: a unique number
Note: The date types are chosen for a column when you create a new table in your database!
'''

SELECT * FROM Orders WHERE OrderDate='2008-11-11'

# CREATE VIEW STATEMENT
# create view examples
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = "Brazil";

# we can query the view above as follows
SELECT * FROM Brazil Customers];

# examples
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

# we can query the view above as follow
SELECT * FROM [Products Above Average Price];

# Updating a View
# create or replace view synatx
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2, ....
FROM table_name
WHERE condition;

# the following sql adds the city column to the brazil customers view
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = "Brazil";

# Dropping a view
DROP VIEW view_name;

DROP VIEW [Brazil Customers];

# SQL INJECTION
'''
SQL injection is a code injection technique that might destroy your database.

SQL injection is one of the most common web hacking techniques.

SQL injection is the placement of malicious code in SQL statements, via web page input.

'''

# sql in a web pages
'''
SQL in Web Pages
SQL injection usually occurs when you ask a user for input, like their username/userid, and instead of a name/id, the user gives you an SQL statement that you will unknowingly run on your database.

Look at the following example which creates a SELECT statement by adding a variable (txtUserId) to a select string. The variable is fetched from user input (getRequestString):

Example
txtUserId = getRequestString("UserId");
txtSQL = "SELECT * FROM Users WHERE UserId = " + txtUserId;

'''

# Injection based on 1=1 is always True
'''
Look at the example above again. The original purpose of the code was to create an SQL statement to select a user, with a given user id.

If there is nothing to prevent a user from entering "wrong" input, the user can enter some "smart" input like this:

UserId:
105 OR 1=1

Then, the SQL statement will look like this:

'''

SELECT * FROM Users WHERE UserId = 105 OR 1=1;

'''
The SQL above is valid and will return ALL rows from the "Users" table, since OR 1=1 is always TRUE.

Does the example above look dangerous? What if the "Users" table contains names and passwords?

The SQL statement above is much the same as this:
'''

SELECT UserId, Name, Password FROM Users WHERE UserId = 105 or 1=1;
# A hacker might get access to all the user names and passwords in a database, by simply inserting 105 OR 1=1 into the input field.


# Injection Based on ""="" is Always True
'''
SQL Injection Based on ""="" is Always True
Here is an example of a user login on a web site:

Username:

John Doe

Password:

myPass

Example
uName = getRequestString("username");
uPass = getRequestString("userpassword");

sql = 'SELECT * FROM Users WHERE Name ="' + uName + '" AND Pass ="' + uPass + '"'
'''

# result
SELECT * FROM Users WHERE Name = "John Doe" AND Pass ="myPass"

'''
A hacker might get access to user names and passwords in a database by simply inserting " OR ""=" into the user name or password text box:

User Name:

" or ""="

Password:

" or ""="

The code at the server will create a valid SQL statement like this:

'''
# result
SELECT * FROM Users WHERE Name ="" or ""="" AND Pass ="" or ""=""

# Injection Based On Batched SQL Statements
'''
Most databases support batched SQL statement.

A batch of SQL statements is a group of two or more SQL statements, separated by semicolons.

The SQL statement below will return all rows from the "Users" table, then delete the "Suppliers" table.

'''
SELECT * FROM Users; DROP TABLES Suppliers

'''
Example
txtUserId = getRequestString("UserId");
txtSQL = "SELECT * FROM Users WHERE UserId = " + txtUserId;

And the following input:

User id:
105; DROP TABLE Suppliers

The valid SQL statement would look like this:
'''

# Result
SELECT * FROM Users WHERE UserId = 105; DROP TABLE Suppliers;

# SQL Parameters For Protection
'''

To protect a web site from SQL injection, you can use SQL parameters.

SQL parameters are values that are added to an SQL query at execution time, in a controlled manner.

ASP.NET Razor Example
txtUserId = getRequestString("UserId");
txtSQL = "SELECT * FROM Users WHERE UserId = @0";
db.Execute(txtSQL,txtUserId);
Note that parameters are represented in the SQL statement by a @ marker.

The SQL engine checks each parameter to ensure that it is correct for its column and are treated literally, and not as part of the SQL to be executed.

Another Example
txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
db.Execute(txtSQL,txtNam,txtAdd,txtCit);
Examples
The following examples shows how to build parameterized queries in some common web languages.

SELECT STATEMENT IN ASP.NET:

txtUserId = getRequestString("UserId");
sql = "SELECT * FROM Customers WHERE CustomerId = @0";
command = new SqlCommand(sql);
command.Parameters.AddWithValue("@0",txtUserID);
command.ExecuteReader();
INSERT INTO STATEMENT IN ASP.NET:

txtNam = getRequestString("CustomerName");
txtAdd = getRequestString("Address");
txtCit = getRequestString("City");
txtSQL = "INSERT INTO Customers (CustomerName,Address,City) Values(@0,@1,@2)";
command = new SqlCommand(txtSQL);
command.Parameters.AddWithValue("@0",txtNam);
command.Parameters.AddWithValue("@1",txtAdd);
command.Parameters.AddWithValue("@2",txtCit);
command.ExecuteNonQuery();
INSERT INTO STATEMENT IN PHP:

$stmt = $dbh->prepare("INSERT INTO Customers (CustomerName,Address,City)
VALUES (:nam, :add, :cit)");
$stmt->bindParam(':nam', $txtNam);
$stmt->bindParam(':add', $txtAdd);
$stmt->bindParam(':cit', $txtCit);
$stmt->execute();

'''

# SQL HOSTING
'''
SQL Hosting
If you want your web site to be able to store and retrieve data from a database, your web server should have access to a database-system that uses the SQL language.

If your web server is hosted by an Internet Service Provider (ISP), you will have to look for SQL hosting plans.

The most common SQL hosting databases are MS SQL Server, Oracle, MySQL, and MS Access.

MS SQL Server
Microsofts SQL Server is a popular database software for database-driven web sites with high traffic.

SQL Server is a very powerful, robust and full featured SQL database system.

Oracle
Oracle is also a popular database software for database-driven web sites with high traffic.

Oracle is a very powerful, robust and full featured SQL database system.

MySQL
MySQL is also a popular database software for web sites.

MySQL is a very powerful, robust and full featured SQL database system.

MySQL is an inexpensive alternative to the expensive Microsoft and Oracle solutions.

Access
When a web site requires only a simple database, Microsoft Access can be a solution.

Access is not well suited for very high-traffic, and not as powerful as MySQL, SQL Server, or Oracle.

'''



# SQL REFERNCES
# SQL KEYWORDS

# ADD	Adds a column in an existing table
ALTER TABLE Customers
ADD Email varchar(255);

# ADD CONSTRAINT	Adds a constraint after a table is already created
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

# ALTER	Adds, deletes, or modifies columns in a table, or changes the data type of a column in a table
ALTER TABLE Customers
ADD Email varchar(255);

ALTER TABLE Customers
DROP COLUMN Email;

# alter column
ALTER TABLE Employees
ALTER COLUMN BirthDate year;

# ALTER COLUMN	Changes the data type of a column in a table
ALTER TABLE Employees
ALTER COLUMN BirthDate year;

# ALTER TABLE	Adds, deletes, or modifies columns in a table
ALTER TABLE Customers
ADD Email varcahr(255);

ALTER TABLE Customers
DROP COLUMN Email;

# ALL	Returns true if all of the subquery values meet the condition
SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

# AND	Only includes rows where both conditions is true
SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

# ANY	Returns true if any of the subquery values meet the condition
SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity = 10);

SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID FROM OrderDetails WHERE Quantity > 99);

# AS	Renames a column or table with an alias
SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

# The following SQL statement creates two aliases. Notice that it requires double quotation marks or square brackets if the alias name contains spaces:
SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

# The following SQL statement creates an alias named "Address" that combine four columns (Address, PostalCode, City and Country):
SELECT CustomerName, Address + ', ' + PostalCode + '' + City + ', ' + Country AS Address
FROM Customers;

# Note: To get the SQL statement above to work in MySQL use the following:
SELECT CustomerName, CONCAT(Address,', ', PostalCode, ', ', City,', ',Country) AS Address
FROM Customers;

# Alias for Tables
SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName="Around the Horn" AND c.CustomerID=o.CustomerID;

# ASC	Sorts the result set in ascending order
SELECT * FROM Customers
ORDER BY CustomerName ASC;

# BETWEEN	Selects values within a given range
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

# CASE	Creates different outputs based on conditions
SELECT OrderID, Quantity,
CASE
  WHEN Quantity > 30 THEN "The quantity is greater than 30"
  WHEN Quantity = 30 THEN "The quantity is 30"
  ELSE "The quantity is under 30"
END
FROM OrderDetails;


# CHECK	A constraint that limits the value that can be placed in a column
# MySQL
CREATE TABLE Person (
  Age int,
  CHECK (Age>=18)
);

# SQL Server / Oracle / MS Access
CREATE TABLE Person (
  Age int CHECK (Age>=18)
);

# MySQL/  SQL Server / Oracle / MS Access
CREATE TABLE Persons (
  Age int,
  City varchar(255),
  CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sanders')
);

# Check on Alter Table
# MySQL/  SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD CHECK (Age>=18);

# MySQL /  SQL Server / Oracle / MS Access
ALTER TABLE Persons
ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandness');


# Drop a Check Constraint
#SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

# MySQL
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;


# COLUMN	Changes the data type of a column or deletes a column in a table
# Alter Column
ALTER TABLE Employees
ALTER COLUMN BirthDate year;

# Drop Column
ALTER TABLE Customers
DROP COLUMN ContactName;

# CONSTRAINT	Adds or deletes a constraint
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

# The DROP CONSTRAINT command is used to delete a UNIQUE, PRIMARY KEY, FOREIGN KEY, or CHECK constraint.
# drop a unique constaint

#SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

# MySQL
ALTER TABLE Persons
DROP INDEX UC_Person;

# drop a primary key constrain
#SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

# MySQL
ALTER TABLE Persons
DROP PRIMARY KEY;

# drop a FOREIGN KEY Constraint
#SQL Server / Oracle / MS Access
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

# MySQL
ALTER TABLE Orders
DROP FOREIGN KEY PK_PersonOrder;

# drop a check constraint
#SQL Server / Oracle / MS Access
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

# CREATE	Creates a database, index, view, table, or procedure
# create database
CREATE DATABASE testDB;

# Create table
CREATE TABLE Persons (
  PersonID, int,
  LastName varcahr(255),
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255)
);

# create table using another table
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customer;

# create index
# The following SQL creates an index named "idx_lastname" on the "LastName" column in the "Persons" table:
CREATE INDEX idex_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

# create unique index
# the following SQL creates an index named "uidx_pid" on the "PersonID" column in the "Persons" table:
CREATE UNIQUE INDEX uidx_pid
ON Persons (PersonID);

# Create view
# A view is a virtual table based on the result set of an SQL statement. The following SQL creates a view that selects all customers from Brazil:
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = "Brazil";

# Create or replace view
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE country = "Brazil";

# query the view
SELECT * FROM [Brazil Customers];

# create procedure
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

# execute the store procedure above as follows:
EXEC SelectAllCustomers;

# CREATE INDEX	Creates an index on a table (allows duplicate values)
'''
The CREATE INDEX command is used to create indexes in tables (allows duplicate values).

Indexes are used to retrieve data from the database very fast. The users cannot see the indexes, they are just used to speed up searches/queries.

'''

CREATE INDEX idx_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

# CREATE OR REPLACE VIEW	Updates a view
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = "Brazil";

# query the view
SELECT * FROM [Brazil Customers];

# CREATE TABLE	Creates a new table in the database
# The CREATE TABLE command creates a new table in the database.
CREATE TABLE Persons(
  PersonID, int,
  LastName varcahr(255),
  FirstName varcahr(255),
  Address varchar(255),
  City varcahr(255)
);

# create table using another table
CREATE TABLE TestTable AS
SELECT customerName, contactname
FROM customers;

# CREATE PROCEDURE	Creates a stored procedure
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

EXEC SelectAllCustomers;

# CREATE UNIQUE INDEX	Creates a unique index on a table (no duplicate values)
CREATE UNIQUE INDEX unix_pid
ON Persons (PersonID);


# CREATE VIEW	Creates a view based on the result set of a SELECT statement
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = "Brazil";

SELECT * FROM [Brazil Customers];

# DATABASE	Creates or deletes an SQL database
CREATE DATABASE testDB;

# drop database
DROP DATABASE testDB;

# DEFAULT	A constraint that provides a default value for a column
CREATE TABLE Persons (
  City warchar(255) DEFAULT 'Sandnes'
);

# the default constrain can also be used to insert system values, by using function like GETDATE();
CREATE TABLE Orders (
  OrderDate date DEFAULT GETDATE()
);

# default on alter table
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

ALTER TABLE Persons
ALTER COLUMN City SET DEFAULT 'Sandnes';

ALTER TABLE Persons
MODIFY City DEFAULT 'Sandnes';

# drop a default constraint
ALTER TABLE Persons
ALTER City DROP DEFAULT;

ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

# DELETE	Deletes rows from a table
DELETE FROM Customers WHERE CustomerName='James Bond';

DELETE FROM Customers;

# DESC	Sorts the result set in descending order
SELECT * FROM Customers
ORDER BY CustomerName DESC;

# DISTINCT	Selects only distinct (different) values
SELECT DISTINCT Country FROM Customers;

# DROP	Deletes a column, constraint, database, index, table, or view
ALTER TABLE Customers
DROP COLUMN ContactName;

# a drop a unique constraint
# SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

# MySQL
ALTER TABLE Persons
DROP INDEX UC_Person;

# Drop a primary key constraint
# SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

# MySQL
ALTER TABLE Perons
DROP PRIMARY KEY;

# Drop a Foreign key constraint
# SQL Sever / Oracle / MS
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

# MySQL
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

# drop a check constraint
# SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

# MySQL
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;

# drop default
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

# Myql
ALTER TABLE Persons
ALTER City DROP DEFAULT;

# Drop index
# ms access
DROP INDEX index_name ON table_name;

# sql sever
DROP INDEX table_name.index_name;

# db2/oracle
DROP INDEX index_name;

# mysql
ALTER TABLE table_name
DROP INDEX index_name;

# drop database
DROP DATABASE testDB;

# drop table
DROP TABLE Shippers;

# Drop view
DROP VIEW [Brazil Customers];


# DROP COLUMN	Deletes a column in a table
ALTER TABLE Customers
DROP COLUMN ContactName;

# DROP CONSTRAINT	Deletes a UNIQUE, PRIMARY KEY, FOREIGN KEY, or CHECK constraint

# # SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

# mysql
ALTER TABLE Persons
DROP INDEX UC_Person;

# drop a primary key constraint
# SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

# sql
ALTER TABLE Persons
DROP PRIMARY KEY;

# drop a foreign key constraint
# # SQL Sever / Oracle / MS
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

# mysql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

# drop a check constraint
# SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT CHK_PersonAge;

# mysql
ALTER TABLE Persons
DROP CHECK CHK_PersonAge;

# DROP DATABASE	Deletes an existing SQL database
DROP DATABASE testDB;

# DROP DEFAULT	Deletes a DEFAULT constraint
# SQL Sever / Oracle / MS
ALTER TABLE Persons
ALTER COLUMN City DROP DEFAULT;

# mysql
ALTER TABLE Persons
ALTER City DROP DEFAULT;

# DROP INDEX	Deletes an index in a table
# ms access
DROP INDEX index_name ON table_name;

# sql server
DROP INDEX table_name.index_name;

# db2/oracle
DROP INDEX index_name

# mysql
ALTER TABLE table_name
DROP INDEX index_name;

# DROP TABLE	Deletes an existing table in the database
DROP TABLE Shippers;

# truncate table
TRUNCATE TABLE Categories

# DROP VIEW	Deletes a view
DROP VIEW [Brazil Customers];

# EXEC	Executes a stored procedure
EXEC SelectAllCustomers;

# EXISTS	Tests for the existence of any record in a subquery
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierId = Supplier.supplierId AND Price < 20);

# the following SQL lits the suppliers with a products price equal to 22
SELECT SupplierName
FROM Suppliers
WHERE EXISTS (SELECT ProductName FROM Products WHERE SupplierId = Suppliers.supplierId AND Price = 22);

# FOREIGN KEY	A constraint that is a key used to link two tables together
# mysql
CREATE TABLE Orders (
  OrderID int NOT NULL,
  OrderName int NOT NULL,
  PersonsID INT
  PRIMARY KEY (OrderID),
  FOREIGN KEY (PersonID) REFERNCES Persons(PersonID)
);

# SQL Sever / Oracle / MS
CREATE TABLE Orders (
  OrderID int NOT NULL PRIMARY KEY,
  OrderNumber int NOT NULL,
  PersonID int,
  PRIMARY KEY (OrderID),
  FOREIGN KEY (PersonID) REFERNCES Persons(PersonsID)
);

# MySQL, SQL Sever / Oracle / MS
CREATE TABLE Orders (
  OrderID in NOT NULL,
  OrderName int NOT NULL,
  PersonID int,
  PRIMARY KEY (OrderID),
  CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
  REFERENCES Person(PersonID)
);

# Foreign key on alter table
# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Orders
ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Orders
ADD CONSTRAINT FK_PersonOrder
FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

# Drop a foreugn key constraint
# mysql
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;

#  SQL Sever / Oracle / MS
ALTER TABLE Orders
DROP CONSTRAINT FK_PersonOrder;

# FROM	Specifies which table to select or delete data from
SELECT CustomerName, City FROM Customers;

SELECT * FROM Customers;

DELETE FROM Customers
WHERE CustomerName="King Jalloh";

# FULL OUTER JOIN	Returns all rows when there is a match in either left table or right table
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

# GROUP BY	Groups the result set (used with aggregate functions: COUNT, MAX, MIN, SUM, AVG)
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

# HAVING	Used instead of WHERE with aggregate functions
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

# IN	Allows you to specify multiple values in a WHERE clause
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

# INDEX	Creates or deletes an index in a table
CREATE INDEX idex_lastname
ON Persons (LastName);

CREATE INDEX idx_pname
ON Persons (LastName, FirstName);

# drop index
# ms
DROP INDEX index_name ON table_name;

# sql server
DROP INDEX table_name.index_name;

# db2 oracle
DROP INDEX index_name;

# mysql
ALTER TABLE table_name
DROP INDEX index_name;

# INNER JOIN	Returns rows that have matching values in both tables
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);

# INSERT INTO	Inserts new rows in a table
INSERT INTO Customers (CustomerName, ContatctName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinaal', 'Stavanger', 'Norway');

# INSERT INTO SELECT	Copies data from one table into another table
INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany'

# IS NULL	Tests for empty values
SELECT CustomerName, ContatctName, Address
FROM Customers
WHERE Address IS NULL,

# IS NOT NULL	Tests for non-empty values
SELECT CustomerName, ContatctName, Address
FROM Customers
WHERE Address IS NOT NULL,

# JOIN	Joins tables
# inner join
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

# example
SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.CustomerID = Customers.CustomerID);

# left join
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

# right join
SELECT Orders.OrderID, employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

# FULL OUTER JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

# LEFT JOIN	Returns all rows from the left table, and the matching rows from the right table
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

# LIKE	Searches for a specified pattern in a column
'''
The LIKE command is used in a WHERE clause to search for a specified pattern in a column.

You can use two wildcards with LIKE:

% - Represents zero, one, or multiple characters
_ - Represents a single character (MS Access uses a question mark (?) instead)
The following SQL selects all customers with a CustomerName starting with "a":
'''

# example
SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

# The following SQL selects all customers with a CustomerName ending with "a":
SELECT * FROM Customers
WHERE CustomerName LIKE '%a';

# The following SQL selects all customers with a CustomerName that have "or" in any position:
SELECT * FROM Customers
WHERE CustomerName LIKE '%or%';

# The following SQL statement selects all customers with a CustomerName that starts with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE CustomerName LIKE 'a_%_%';

# LIMIT	Specifies the number of records to return in the result set
SELECT TOP 3 * FROM Customers

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
WHERE ROWNUM <= 3;



# NOT	Only includes rows where a condition is not true
SELECT * FROM Customers
WHERE NOT Country = 'Germany';

# NOT NULL	A constraint that enforces a column to not accept NULL values
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255) NOT NULL,
  Age int
);

ALTER TABLE Persons
MODIFY Age int NOT NULL;

# OR	Includes rows where either condition is true
SELECT * FROM Customers
WHERE City='Berlin' OR City='Muchen'

# ORDER BY	Sorts the result set in ascending or descending order
SELECT * FROM Customers
ORDER BY CustomerName;

# asc
SELECT * FROM Customers
ORDER BY CustomerName ASC;

# decs
SELECT * FROM Customers
ORDER BY CustomerName DESC;

# OUTER JOIN	Returns all rows when there is a match in either left table or right table
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ODER BY Customers.CustomerName;

# PRIMARY KEY	A constraint that uniquely identifies each record in a database table
# mysql
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  PRIMARY KEY (ID)
);

# MySQL, SQL Sever / Oracle / MS
CREATE TABLE Persons (
  ID int NOT NULL PRIMARY KEY,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age int
);

# MySQL, SQL Sever / Oracle / MS
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varcahr(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  CONSTRAINT PK_Person PRIMARY KEY (ID, LastName)
);

# Primary key on Alter Table
# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
ADD PRIMARY KEY (ID);

# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (ID, LastName);

# drop a primary key constrain
# mysql
ALTER TABLE Persons
DROP PRIMARY KEY;

# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT PK_Person;

# PROCEDURE	A stored procedure
CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

# RIGHT JOIN	Returns all rows from the right table, and the matching rows from the left table
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

# ROWNUM	Specifies the number of records to return in the result set
'''
The SELECT TOP command is used to specify the number of records to return.

Note: Not all database systems support SELECT TOP. MySQL uses LIMIT, and Oracle uses ROWNUM.

The following SQL statement selects the first three records from the "Customers" table:
'''

SELECT TOP 3 * FROM Customers;

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
WHERE ROWNUM <= 3;

# SELECT	Selects data from a database
SELECT CustomerName, City FROM Customers;

SELECT * FROM Customers;

# SELECT DISTINCT	Selects only distinct (different) values
SELECT DISTINCT Country FROM Customers;

# SELECT INTO	Copies data from one table into a new table
SELECT * INFO CustomersBackup2017
FROM Customers

SELECT * INFO CustomersOrderBackup2017 in 'Backup.mdb'
FROM Customers

SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;

SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';

SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

# SELECT TOP	Specifies the number of records to return in the result set
SELECT TOP 3 * FROM Customers

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
WHERE ROWNUM <= 3;

# SET	Specifies which columns and values that should be updated in a table
UPDATE Customers
SET ContactName = 'King Jalloh', City = 'London'
WHERE CustomerID = 1;

UPDATE Customers
SET ContactName = 'Juan'
WHERE Country = 'Mexico';


# TABLE	Creates a table, or adds, deletes, or modifies columns in a table, or deletes a table or data inside a table
'''
The CREATE TABLE command creates a new table in the database.

The following SQL creates a table called "Persons" that contains five columns: PersonID, LastName, FirstName, Address, and City:
'''

CREATE TABLE Persons (
  PersonID int,
  LastName varchar(255),
  FirstName varchar(255),
  Address varchar(255),
  City varchar(255)
);

# create table using another table
CREATE TABLE TestTable AS
SELECT customername, contactname
FROM customers;

# alter table
ALTER TABLE Customers
ADD Email varchar(255);

ALTER TABLE Customers
DROP COLUMN Email;

DROP TABLE Shippers;

# truncate table
TRUNCATE TABLE Catagories;

# TOP	Specifies the number of records to return in the result set
SELECT TOP 3 * FROM Customers

SELECT * FROM Customers
LIMIT 3;

SELECT * FROM Customers
WHERE ROWNUM <= 3;

# TRUNCATE TABLE	Deletes the data inside a table, but not the table itself
DROP TABLE Shippers

# truncate table
TRUNCATE TABLE Categories;

# UNION	Combines the result set of two or more SELECT statements (only distinct values)
# union
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

# union all
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

# UNION ALL	Combines the result set of two or more SELECT statements (allows duplicate values)
SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City

# union all
SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

# UNIQUE	A constraint that ensures that all values in a column are unique
# sql unique constraints on create table
# MySQL, SQL Sever / Oracle / MS
CREATE TABLE Persons(
  ID int NOT NULL UNIQUE,
  LastName varchar(255) NOT NULL,
  FirstName varchar()
);

# mysql
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varcahr(255) NOT NULL,
  FirstName varchar(255),
  Age int,
  UNIQUE (ID)
);


# MySQL, SQL Sever / Oracle / MS
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varcahr(255),
  Age int
  CONSTRAINT UC_Person UNIQUE (ID, LastName)
);

# unique constraints on Alter table
# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
ADD UNIQUE (ID);

# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID, LastName);

# drop a unique constraint
# mysql
ALTER TABLE Persons
DROP INDEX UC_Person;

# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

# UPDATE	Updates existing rows in a table
# MySQL, SQL Sever / Oracle / MS

CREATE TABLE Personas (
  ID int NOT NULL UNIQUE,
  LastName varchar(255) NOT NULL,
  FirstName varcahr(255),
  Age int
);

# mysql
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar (255) NOT NULL,
  FirstName varchar(255),
  Age int,
  UNIQUE (ID)
);

# MySQL, SQL Sever / Oracle / MS
CREATE TABLE Persons (
  ID int NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),
  Age in,
  CONSTRAINT UC_Person UNIQUE (ID, LastName)
);

# sql unique constraint on ALTER TABLE
ALTER TABLE Persons
ADD UNIQUE (ID);

ALTER TABLE Persons
ADD CONSTRAINT UC_Person UNIQUE (ID, LastName);

# drop a unique constants
# mysql
ALTER TABLE Persons
DROP INDEX UC_Person;

# MySQL, SQL Sever / Oracle / MS
ALTER TABLE Persons
DROP CONSTRAINT UC_Person;

# VALUES	Specifies the values of an INSERT INTO statement
INSERT INTO Customers (CustomerName, ContatctName, Address, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

# VIEW	Creates, updates, or deletes a view
# create view
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

# query the view
SELECT * FROM [Brazil Customers];

# create or replace view
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';

# drop view
DROP VIEW [Brazil Customers];

# WHERE	Filters a result set to include only records that fulfill a specified condition
# select
SELECT * FROM Customers
WHERE Country='Mexico';

SELECT * FROM Customers
WHERE CustomerID=1;

'''
Operator	Description
=	Equal
<>	Not equal. Note: In some versions of SQL this operator may be written as !=
>	Greater than
<	Less than
>=	Greater than or equal
<=	Less than or equal
BETWEEN	Between a certain range
LIKE	Search for a pattern
IN	To specify multiple possible values for a column
'''


# MYSQL FUNCTIONS
# ASCII	Returns the ASCII value for the specific character
SELECT ASCII (CustomerName) AS NumCodeOfFirstChar
FROM Customers;



# CHAR_LENGTH	Returns the length of a string (in characters)
SELECT CHAR_LENGTH("SQL Tutorial") AS LengthOfString;

# more exmaple
SELECT CHAR_LENGTH(CustomerName) AS LengthOfName
FROM Customers;

# CHARACTER_LENGTH	Returns the length of a string (in characters)
SELECT CHARACTER_LENGTH("SQL Tutorial") AS LengthOfString;

SELECT CHARACTER_LENGTH(CustomerName) AS LengthOfName
FROM Customers;

# CONCAT	Adds two or more expressions together
SELECT CONCAT("SQL", "Tutorial ", "is ", "fun!") AS ConcatenatedString;

SELECT CONCAT(Address, "", PostalCode, "", City) AS Address
FROM Customers;

# CONCAT_WS	Adds two or more expressions together with a separator
SELECT CONCAT_WS("-", "SQL", "Tutorial", "is", "fun!") AS ConcatenatedString;

# example
SELECT CONCAT_WS(" ", Address, PostalCode, City) AS Address
FROM Customers;

# FIELD	Returns the index position of a value in a list of values
SELECT FIELD("q", "s", "q", "1")

# example
SELECT FIELD ("c","a","b");

SELECT FIELD("Q", "s", "q", "1");

SELECT FIELD(5,0,1,2,3,4,5);

# FIND_IN_SET	Returns the position of a string within a list of strings
SELECT FIND_IN_SET("q", "s,q,1");

# example
SELECT FIND_IN_SET("a","s,q,1");

SELECT FIND_IN_SET("q", null);

# FORMAT	Formats a number to a format like "#,###,###.##", rounded to a specified number of decimal places
SELECT FORMAT(250500.5634, 2);

SELECT FORMAT(250500.5634, 0);

# INSERT	Inserts a string within a string at the specified position and for a certain number of characters
SELECT INSERT("W3Schools.com", 1, 9, "Example");

SELECT INSERT("W3Schools.com", 11, 3, "no");


# INSTR	Returns the position of the first occurrence of a string in another string
SELECT INSTR("W3Schools.com", "3") AS MatchPosition;
# examples
SELECT INSTR(CustomerName, "a")
FROM Customers;

# LCASE	Converts a string to lower-case
SELECT LCASE("SQL Tutorial is FUN!")

# example
SELECT LCASE(CustomerName) AS LowercaseCustomerName
FROM Customers;

# LEFT	Extracts a number of characters from a string (starting from left)
SELECT LEFT("SQL Tutorial", 3) AS ExtractString;

SELECT LEFT(CustomerName, 5) AS ExtractString
FROM Customers;

# LENGTH	Returns the length of a string (in bytes)
SELECT LENGTH("SQL Tutorial") AS LengthOfString

SELECT LENGTH(CustomerName) AS LengthOfName
FROM Customers;

# LOCATE	Returns the position of the first occurrence of a substring in a string
SELECT LOCATE("3", "W3Schools.com") AS MatchPosition;

SELECT LOCATE("com", "W3Schools.com", 3) AS MatchPosition;

SELECT LOCATE("a", CustomerName)
FROM Customers;

# LOWER	Converts a string to lower-case
SELECT LOWER("SQL Tutorial is FUN!")

SELECT LOWER(CustomerName) AS LowercaseCustomerName
FROM Customers;

# LPAD	Left-pads a string with another string, to a certain length
SELECT LPAD("SQL Tutorial", 20, "ABC");

SELECT LPAD(CustomerName, 30, "ABC") AS LeftPadCustomerName
FROM Customers;

# LTRIM	Removes leading spaces from a string
SELECT LTRIM("        SQL Tutorial") AS LeftTrimmedString;

# MID	Extracts a substring from a string (starting at any position)
SELECT MID("SQL Tutorial", 5, 3) AS ExtractString;

SELECT MID(CustomerName, 2, 5) AS ExtractString
FROM Customers;

SELECT MID("SQL Tutorial", -5, 5) AS ExtractString;

# POSITION	Returns the position of the first occurrence of a substring in a string
SELECT POSITION("3" IN "W3Schools.com") AS MatchPosition;

SELECT POSITION("COM" IN "W3Schools.com") AS MatchPosition;

SELECT POSITION("a" IN CustomerName)
FROM Customers;

# REPEAT	Repeats a string as many times as specified
SELECT REPREAT("SQL Tutorial", 3);

SELECT REPREAT(CustomerName, 2)
FROM Customers;

SELECT REPREAT("SQL Tutorial", 0);

# REPLACE	Replaces all occurrences of a substring within a string, with a new substring
SELECT REPLACE("SQL Tutorial", "SQL", "HTML");

SELECT REPLACE("XYZ FGH XYZ", "X", "M");

SELECT REPLACE("XYZ FGH XYZ", "X", "m");

# REVERSE	Reverses a string and returns the result
SELECT REVERSE("SQL Tutorial");

SELECT REVERSE(CustomerName)
FROM Customers;

# RIGHT	Extracts a number of characters from a string (starting from right)
SELECT RIGHT("SQL Tutorial is cool", 4) AS ExtractString;

SELECT RIGHT(CustomerName, 5) AS ExtractString
FROM Customers;

# RPAD	Right-pads a string with another string, to a certain length
SELECT PRAD("SQL Tutorial", 20, "ABC");

SELECT PRAD(CustomerName, 30, "ABC") AS RightPadCustomerName
FROM Customers;

# RTRIM	Removes trailing spaces from a string
SELECT RTRIM("SQL Tutorial         ") AS RightTrimmedString;

# SPACE	Returns a string of the specified number of space characters
SELECT SPACE(10);

# STRCMP	Compares two strings
SELECT STRCMP("SQL Tutorial", "SQL Tutorial");

SELECT STRCMP("SQL Tutorial", "SQL Tutorial");

# SUBSTR	Extracts a substring from a string (starting at any position)
SELECT SUBSTR("SQL Tutorial", 5, 3) AS ExtractString;

SELECT SUBSTR(CustomerName, 2, 5) AS ExtractString
FROM Customers

# Extract a substring from a string (start from the end, at position -5, extract 5 characters):
SELECT SUBSTR("SQL Tutorial", -5, 5) AS ExtractString;

# SUBSTRING	Extracts a substring from a string (starting at any position)
 SELECT SUBSTRING("SQL Tutorial", 5, 3) AS ExtractString;

 SELECT SUBSTRING(CustomerName, 2, 5) AS ExtractString
 FROM Customers

 SELECT SUBSTRING("SQL Tutorial", -5, 3) AS ExtractString;

# SUBSTRING_INDEX	Returns a substring of a string before a specified number of delimiter occurs
SELECT SUBSTRING_INDEX("www.w3w3schools.com", ".",11);

SELECT SUBSTRING_INDEX("www.w3w3schools.com", ".", 2);

# TRIM	Removes leading and trailing spaces from a string
SELECT TRIM('       SQL Tutorial        ') AS TrimmedString;

# UCASE	Converts a string to upper-case
SELECT UCASE("SQL Tutorial is FUN!";

SELECT UCASE(CustomerName) AS UppercaseCustomerName
FROM Customers;

# UPPER	Converts a string to upper-case
SELECT UPPER("SQL Tutorial is FUN!";

SELECT UPPER(CustomerName) AS UppercaseCustomerName
FROM Customers;


# MYSQL NUMERIC FUNCTIONS
# ABS	Returns the absolute value of a number
SELECT ABS(-243.5);

# ACOS	Returns the arc cosine of a number
SELECT ACOS(0.25);

# ASIN	Returns the arc sine of a number
SELECT ASIN(-0.8);

# ATAN	Returns the arc tangent of one or two numbers
SELECT ATAN(2.5);

# ATAN2	Returns the arc tangent of two numbers
SELECT ATAN2(0.50, 1);

# AVG	Returns the average value of an expression
SELECT AVG(Price) AS AveragePrice FROM Products;

# CEIL	Returns the smallest integer value that is >= to a number
SELECT * FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

# CEIL	Returns the smallest integer value that is >= to a number
SELECT CEIL(27.75);

# CEILING	Returns the smallest integer value that is >= to a number
SELECT CEILING(26.89);

# COS	Returns the cosine of a number
SELECT COS(2);

SELECT COS(PI());

# COT	Returns the cotangent of a number
SELECT COT(11);

# COUNT	Returns the number of records returned by a select query
SELECT COUNT(ProductID) AS NumberOfOrders FROM Products;

# DEGREES	Converts a value in radians to degrees
SELECT DEGREES(1.5);

SELECT DEGREES(PI()*2);

# DIV	Used for integer division
SELECT 10 DIV 5;

# EXP	Returns e raised to the power of a specified number
SELECT EXP(1);

# FLOOR	Returns the largest integer value that is <= to a number
SELECT FLOOR(2.39);

# GREATEST	Returns the greatest value of the list of arguments
SELECT GREATEST(3,3,43,2,3);
SELECT GREATEST("w3Schools.com", "microsoft.com", "apple.com");


# LEAST	Returns the smallest value of the list of arguments
SELECT LEAST(32,3243,4);
SELECT LEAST("w3Schools.com", "microsoft.com", "apple.com")

#LN	Returns the natural logarithm of a number
SELECT LN(2);

#LOG	Returns the natural logarithm of a number, or the logarithm of a number to a specified base
SELECT LOG(2);

#LOG10	Returns the natural logarithm of a number to base 10
SELECT LOG10(23);

#LOG2	Returns the natural logarithm of a number to base 2
SELECT LOG2(6);

#MAX	Returns the maximum value in a set of values
SELECT MAX(Price) AS LargestPrice FROM Customers;

#MIN	Returns the minimum value in a set of values
SELECT MIN(Price) AS SmallestPrice FROM Customers;

#MOD	Returns the remainder of a number divided by another number
SELECT MOD(19, 9);
SELECT 18 MOD 4;
SELECT 18 % 4;

#PI	Returns the value of PI
SELECT PI();

# POW	Returns the value of a number raised to the power of another number
SELECT POW(4, 2)

# POWER	Returns the value of a number raised to the power of another number
SELECT POWER(4, 2);

# RADIANS	Converts a degree value into radians
SELECT RADIANS(180)

#RAND	Returns a random number
SELECT RAND();

#ROUND	Rounds a number to a specified number of decimal places
SELECT ROUND(135.375, 2);
SELECT ProductName, Price, ROUND(Price, 1) AS RoundedPrice
FROM Products;

#SIGN	Returns the sign of a number
SELECT SIGN(255.5);

#SIN	Returns the sine of a number
SELECT SIN(2);

#SQRT	Returns the square of a number
SELECT SQRT(64);

#SUM	Calculates the sum of a set of values
SELECT SUM(Quantity) AS TotalItemsOrdered FROM OrderDetails;

#TAN	Returns the tangent of a number
SELECT TAN(1.75);

#TRUNCATE	Truncates a number to the specified number of decimal places
SELECT TRUNCATE(135.375, 2);

# MYSQL DATE FUNCTIONS


#ADDDATE	Adds a time/date interval to a date and then returns the date
SELECT ADDDATE("2017-06-15", INTERVAL 10 DAY);

SELECT ADDDATE("2017-06-15 09:34:21", INTERVAL 15 MINUTE);

SELECT ADDTIME("2017-06-15 09:34:21", INTERVAL -3 HOUR);

SELECT ADDDATE("2017-06-15 09:34:21", INTERVAL -2 MONTH);

#ADDTIME	Adds a time interval to a time/datetime and then returns the time/datetime
SELECT ADDTIME("2017-06-15 09:34:21", "2");

# add 5 seconds and 3 microsecond to a time and return the datatime;
SELECT ADDTIME("2017-06-15 09:34:21.0000001", "5.0000003");

#CURDATE	Returns the current date
SELECT CURDDATE();

# return the current date + 1:
SELECT CURDATE() + 1;

#CURRENT_DATE	Returns the current date
SELECT CURRENT_DATE();

SELECT CURRENT_DATE() + 1;

#CURRENT_TIME	Returns the current time
SELECT CURRENT_TIME();

SELECT CURRENT_TIME() + 1;

#CURRENT_TIMESTAMP	Returns the current date and time
SELECT CURRENT_TIMESTAMP();

SELECT CURRENT_TIMESTAMP() + 1;

#CURTIME	Returns the current time
SELECT CURTIME();

SELECT CURTIME() + 1;

#DATE	Extracts the date part from a datetime expression
SELECT DATA("2017-06-15");

SELECT DATA("2017-06-15 09:32:21");

SELECT DATA("The date is 2017-06-12 ");

SELECT DATE(OrderDate) FROM Orders;

#DATEDIFF	Returns the number of days between two date values
SELECT DATEDIFF("2017-06-15", "2017-06-12")

SELECT DATEDIFF("2017-06-15 09:32:21", "2017-06-15 09:32:22");

#DATE_ADD	Adds a time/date interval to a date and then returns the date
SELECT DATE_ADD("2017-06-15", INTERVAL 10 DAY);

SELECT DATE_ADD("2017-06-15 09:32:12", INTERVAL 15 MINUTE);

SELECT DATE_ADD("2017-06-15 09:32:12", INTERVAL -3 HOUR);

#DATE_FORMAT	Formats a date
SELECT DATE_FORMAT("2017-06-15", "%Y");

SELECT DATE_FORMAT("2017-06-15", "%M %d %Y");

SELECT DATE_FORMAT("2017-06-15", "%W %M %e %Y");

SELECT DATE_FORMAT(BirthDate, "%W %M %e %Y") FROM Employees;

#DATE_SUB	Subtracts a time/date interval from a date and then returns the date
SELECT DATE_SUB("2017-06-15", INTERVAL 10 DAY);

SELECT DATE_SUB("2017-06-15 09:32:12", INTERVAL 15 MINUTE);

SELECT DATE_SUB("2017-06-15 09:32:12", INTERVAL -3 HOUR);

#DAY	Returns the day of the month for a given date
SELECT DAY("2017-06-15");

SELECT DAY(CURDATE());

#DAYNAME	Returns the weekday name for a given date
SELECT DAYNAME("2017-06-15");

SELECT DATENAME("2017-06-15 09:32:12");

SELECT DATENAME(CURDATE());

#DAYOFMONTH	Returns the day of the month for a given date
SELECT DAYOFMONTH("2017-06-15");

SELECT DAYOFMONTH("2017-06-15 09:32:21");

SELECT DAYOFMONTH(CURDATE());


#DAYOFWEEK	Returns the weekday index for a given date
SELECT DAYOFWEEK("2017-06-15");

SELECT DAYOFWEEK("2017-06-15 09:32:21");

SELECT DAYOFWEEK(CURDATE());


#DAYOFYEAR	Returns the day of the year for a given date
SELECT DAYOFYEAR("2017-06-15");

SELECT DAYOFYEAR("2017-06-15 09:32:21");

SELECT DAYOFYEAR(CURDATE());

#EXTRACT	Extracts a part from a given date
SELECT EXTRACT (MONTH FROM "2017-06-15");

SELECT EXTRACT(WEEK FROM "2017-06-15");

SELECT EXTRACT(MINUTE FROM "2017-06-15 09:20:21");

SELECT EXTRACT(YEAR_MONTH FROM "2017-06-15 09:20:21");

#FROM_DAYS	Returns a date from a numeric datevalue
SELECT FROM_DAYS(685467);


#HOUR	Returns the hour part for a given date
SELECT HOUR("2018-11-13 09:32:11");

SELECT HOUR("838:59:59")

#LAST_DAY	Extracts the last day of the month for a given date
SELECT LAST_DAY("2017-06-20");

SELECT LAST_DAY("2017-06-20 09:32:21");


#LOCALTIME	Returns the current date and time
SELECT LOCALTIME();
SELECT LOCALTIME() + 1; 

#LOCALTIMESTAMP	Returns the current date and time
#MAKEDATE	Creates and returns a date based on a year and a number of days value
#MAKETIME	Creates and returns a time based on an hour, minute, and second value
#MICROSECOND	Returns the microsecond part of a time/datetime
#MINUTE	Returns the minute part of a time/datetime
#MONTH	Returns the month part for a given date
#MONTHNAME	Returns the name of the month for a given date
#NOW	Returns the current date and time
#PERIOD_ADD	Adds a specified number of months to a period
#PERIOD_DIFF	Returns the difference between two periods
#QUARTER	Returns the quarter of the year for a given date value
#SECOND	Returns the seconds part of a time/datetime
#SEC_TO_TIME	Returns a time value based on the specified seconds
#STR_TO_DATE	Returns a date based on a string and a format
#SUBDATE	Subtracts a time/date interval from a date and then returns the date
#SUBTIME	Subtracts a time interval from a datetime and then returns the time/datetime
#SYSDATE	Returns the current date and time
#TIME	Extracts the time part from a given time/datetime
#TIME_FORMAT	Formats a time by a specified format
#TIME_TO_SEC	Converts a time value into seconds
#TIMEDIFF	Returns the difference between two time/datetime expressions
#TIMESTAMP	Returns a datetime value based on a date or datetime value
#TO_DAYS	Returns the number of days between a date and date "0000-00-00"
#WEEK	Returns the week number for a given date
#WEEKDAY	Returns the weekday number for a given date
#WEEKOFYEAR	Returns the week number for a given date
#YEAR	Returns the year part for a given date
#YEARWEEK	Returns the year and week number for a given date

# MYSQL ADVANCED FUNCTIONS

#BIN	Returns a binary representation of a number
#BINARY	Converts a value to a binary string
#CASE	Goes through conditions and return a value when the first condition is met
#CAST	Converts a value (of any type) into a specified datatype
#COALESCE	Returns the first non-null value in a list
#CONNECTION_ID	Returns the unique connection ID for the current connection
#CONV	Converts a number from one numeric base system to another
#CONVERT	Converts a value into the specified datatype or character set
#CURRENT_USER	Returns the user name and host name for the MySQL account that the server used to authenticate the current client
#DATABASE	Returns the name of the current database
#IF	Returns a value if a condition is TRUE, or another value if a condition is FALSE
#IFNULL	Return a specified value if the expression is NULL, otherwise return the expression
#ISNULL	Returns 1 or 0 depending on whether an expression is NULL
#LAST_INSERT_ID	Returns the AUTO_INCREMENT id of the last row that has been inserted or updated in a table
#NULLIF	Compares two expressions and returns NULL if they are equal. Otherwise, the first expression is returned
#SESSION_USER	Returns the current MySQL user name and host name
#SYSTEM_USER	Returns the current MySQL user name and host name
#USER	Returns the current MySQL user name and host name
#VERSION	Returns the current version of the MySQL database


# SQL SERVER FUNCTIONS

# SQL Sever String Functions
#ASCII	Returns the ASCII value for the specific character
#CHAR	Returns the character based on the ASCII code
#CHARINDEX	Returns the position of a substring in a string
#CONCAT	Adds two or more strings together
#Concat with +	Adds two or more strings together
#CONCAT_WS	Adds two or more strings together with a separator
#DATALENGTH	Returns the number of bytes used to represent an expression
#DIFFERENCE	Compares two SOUNDEX values, and returns an integer value
#FORMAT	Formats a value with the specified format
#LEFT	Extracts a number of characters from a string (starting from left)
#LEN	Returns the length of a string
#LOWER	Converts a string to lower-case
#LTRIM	Removes leading spaces from a string
#NCHAR	Returns the Unicode character based on the number code
#PATINDEX	Returns the position of a pattern in a string
#QUOTENAME	Returns a Unicode string with delimiters added to make the string a valid SQL Server delimited identifier
#REPLACE	Replaces all occurrences of a substring within a string, with a new substring
#REPLICATE	Repeats a string a specified number of times
#REVERSE	Reverses a string and returns the result
#RIGHT	Extracts a number of characters from a string (starting from right)
#RTRIM	Removes trailing spaces from a string
#SOUNDEX	Returns a four-character code to evaluate the similarity of two strings
#SPACE	Returns a string of the specified number of space characters
#STR	Returns a number as string
#STUFF	Deletes a part of a string and then inserts another part into the string, starting at a specified position
#SUBSTRING	Extracts some characters from a string
#TRANSLATE	Returns the string from the first argument after the characters specified in the second argument are translated into the characters specified in the third argument.
#TRIM	Removes leading and trailing spaces (or other specified characters) from a string
#UNICODE	Returns the Unicode value for the first character of the input expression
#UPPER	Converts a string to upper-case


# SQL Server Math/Numeric Functions
#ABS	Returns the absolute value of a number
#ACOS	Returns the arc cosine of a number
#ASIN	Returns the arc sine of a number
#ATAN	Returns the arc tangent of a number
#ATN2	Returns the arc tangent of two numbers
#AVG	Returns the average value of an expression
#CEILING	Returns the smallest integer value that is >= a number
#COUNT	Returns the number of records returned by a select query
#COS	Returns the cosine of a number
#COT	Returns the cotangent of a number
#DEGREES	Converts a value in radians to degrees
#EXP	Returns e raised to the power of a specified number
#FLOOR	Returns the largest integer value that is <= to a number
#LOG	Returns the natural logarithm of a number, or the logarithm of a number to a specified base
#LOG10	Returns the natural logarithm of a number to base 10
#MAX	Returns the maximum value in a set of values
#MIN	Returns the minimum value in a set of values
#PI	Returns the value of PI
#POWER	Returns the value of a number raised to the power of another number
#RADIANS	Converts a degree value into radians
#RAND	Returns a random number
#ROUND	Rounds a number to a specified number of decimal places
#SIGN	Returns the sign of a number
#SIN	Returns the sine of a number
#SQRT	Returns the square of a number
#SQUARE	Returns the square of a number
#SUM	Calculates the sum of a set of values
#TAN	Returns the tangent of a number

# SQL Server Data Functions


#CURRENT_TIMESTAMP	Returns the current date and time
#DATEADD	Adds a time/date interval to a date and then returns the date
#DATEDIFF	Returns the difference between two dates
#DATEFROMPARTS	Returns a date from the specified parts (year, month, and day values)
#DATENAME	Returns a specified part of a date (as string)
#DATEPART	Returns a specified part of a date (as integer)
#DAY	Returns the day of the month for a specified date
#GETDATE	Returns the current database system date and time
#GETUTCDATE	Returns the current database system UTC date and time
#ISDATE	Checks an expression and returns 1 if it is a valid date, otherwise 0
#MONTH	Returns the month part for a specified date (a number from 1 to 12)
#SYSDATETIME	Returns the date and time of the SQL Server
#YEAR	Returns the year part for a specified date


# SQL Server Advanced Functions
#CAST	Converts a value (of any type) into a specified datatype
#COALESCE	Returns the first non-null value in a list
#CONVERT	Converts a value (of any type) into a specified datatype
#CURRENT_USER	Returns the name of the current user in the SQL Server database
#ISNULL	Return a specified value if the expression is NULL, otherwise return the expression
#ISNUMERIC	Tests whether an expression is numeric
#NULLIF	Returns NULL if two expressions are equal
#SESSION_USER	Returns the name of the current user in the SQL Server database
#SESSIONPROPERTY	Returns the session settings for a specified option
#SYSTEM_USER	Returns the login name for the current user
#USER_NAME	Returns the database user name based on the specified id



# SQL OPERATORS
# Arithmetic Operators
'''
Operator	Description	Example
+	Add
-	Subtract
*	Multiply
/	Divide
%	Modulo

'''

# Bitwise Operators
'''
Operator	Description
&	Bitwise AND
|	Bitwise OR
^	Bitwise exclusive OR

'''

# Comparison Operators
'''
=	Equal to
>	Greater than
<	Less than
>=	Greater than or equal to
<=	Less than or equal to
<>	Not equal to

'''

# Compound Operators
'''
+=	Add equals
-=	Subtract equals
*=	Multiply equals
/=	Divide equals
%=	Modulo equals
&=	Bitwise AND equals
^-=	Bitwise exclusive equals
|*=	Bitwise OR equals

'''
# Logical Operators
'''
Operator	Description	Example
ALL	TRUE if all of the subquery values meet the condition
AND	TRUE if all the conditions separated by AND is TRUE
ANY	TRUE if any of the subquery values meet the condition
BETWEEN	TRUE if the operand is within the range of comparisons
EXISTS	TRUE if the subquery returns one or more records
IN	TRUE if the operand is equal to one of a list of expressions
LIKE	TRUE if the operand matches a pattern
NOT	Displays a record if the condition(s) is NOT TRUE
OR	TRUE if any of the conditions separated by OR is TRUE
SOME	TRUE if any of the subquery values meet the condition
'''


# SQL DATA TYPES FOR MYSQL, SQL SERVER, AND MS ACCESS

# Mysql Data Types
'''
Data type	Description

CHAR(size)	Holds a fixed length string (can contain letters, numbers, and special characters). The fixed size is specified in parenthesis. Can store up to 255 characters

VARCHAR(size)	Holds a variable length string (can contain letters, numbers, and special characters). The maximum size is specified in parenthesis. Can store up to 255 characters. Note: If you put a greater value than 255 it will be converted to a TEXT type

TINYTEXT	Holds a string with a maximum length of 255 characters

TEXT	Holds a string with a maximum length of 65,535 characters

BLOB	For BLOBs (Binary Large OBjects). Holds up to 65,535 bytes of data

MEDIUMTEXT	Holds a string with a maximum length of 16,777,215 characters

MEDIUMBLOB	For BLOBs (Binary Large OBjects). Holds up to 16,777,215 bytes of data

LONGTEXT	Holds a string with a maximum length of 4,294,967,295 characters

LONGBLOB	For BLOBs (Binary Large OBjects). Holds up to 4,294,967,295 bytes of data

ENUM(x,y,z,etc.)	Let you enter a list of possible values. You can list up to 65535 values in an ENUM list. If a value is inserted that is not in the list, a blank value will be inserted.

Note: The values are sorted in the order you enter them. You enter the possible values in this format: ENUM('X','Y','Z')

SET	Similar to ENUM except that SET may contain up to 64 list items and can store more than one choice

'''

# Number data types:
'''
Data type	Description
TINYINT(size)	-128 to 127 normal. 0 to 255 UNSIGNED*. The maximum number of digits may be specified in parenthesis

SMALLINT(size)	-32768 to 32767 normal. 0 to 65535 UNSIGNED*. The maximum number of digits may be specified in parenthesis

MEDIUMINT(size)	-8388608 to 8388607 normal. 0 to 16777215 UNSIGNED*. The maximum number of digits may be specified in parenthesis

INT(size)	-2147483648 to 2147483647 normal. 0 to 4294967295 UNSIGNED*. The maximum number of digits may be specified in parenthesis

BIGINT(size)	-9223372036854775808 to 9223372036854775807 normal. 0 to 18446744073709551615 UNSIGNED*. The maximum number of digits may be specified in parenthesis

FLOAT(size,d)	A small number with a floating decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter

DOUBLE(size,d)	A large number with a floating decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter

DECIMAL(size,d)	A DOUBLE stored as a string , allowing for a fixed decimal point. The maximum number of digits may be specified in the size parameter. The maximum number of digits to the right of the decimal point is specified in the d parameter

'''

# Date data Types:
'''
Data type	Description
DATE()	A date. Format: YYYY-MM-DD
Note: The supported range is from '1000-01-01' to '9999-12-31'

DATETIME()	*A date and time combination. Format: YYYY-MM-DD HH:MI:SS
Note: The supported range is from '1000-01-01 00:00:00' to '9999-12-31 23:59:59'

TIMESTAMP()	*A timestamp. TIMESTAMP values are stored as the number of seconds since the Unix epoch ('1970-01-01 00:00:00' UTC). Format: YYYY-MM-DD HH:MI:SS
Note: The supported range is from '1970-01-01 00:00:01' UTC to '2038-01-09 03:14:07' UTC

TIME()	A time. Format: HH:MI:SS
Note: The supported range is from '-838:59:59' to '838:59:59'

YEAR()	A year in two-digit or four-digit format.
Note: Values allowed in four-digit format: 1901 to 2155. Values allowed in two-digit format: 70 to 69, representing years from 1970 to 2069

'''
# Sql Server Data Types
'''
Data type	Description	Max size	Storage
char(n)	Fixed width character string	8,000 characters	Defined width
varchar(n)	Variable width character string	8,000 characters	2 bytes + number of chars
varchar(max)	Variable width character string	1,073,741,824 characters	2 bytes + number of chars
text	Variable width character string	2GB of text data	4 bytes + number of chars
nchar	Fixed width Unicode string	4,000 characters	Defined width x 2
nvarchar	Variable width Unicode string	4,000 characters
nvarchar(max)	Variable width Unicode string	536,870,912 characters
ntext	Variable width Unicode string	2GB of text data
binary(n)	Fixed width binary string	8,000 bytes
varbinary	Variable width binary string	8,000 bytes
varbinary(max)	Variable width binary string	2GB
image	Variable width binary string	2GB
'''

# number data types:
'''
Data type	Description	Storage
bit	Integer that can be 0, 1, or NULL
tinyint	Allows whole numbers from 0 to 255	1 byte
smallint	Allows whole numbers between -32,768 and 32,767	2 bytes
int	Allows whole numbers between -2,147,483,648 and 2,147,483,647	4 bytes
bigint	Allows whole numbers between -9,223,372,036,854,775,808 and 9,223,372,036,854,775,807	8 bytes
decimal(p,s)	Fixed precision and scale numbers.
Allows numbers from -10^38 +1 to 10^38 –1.

The p parameter indicates the maximum total number of digits that can be stored (both to the left and to the right of the decimal point). p must be a value from 1 to 38. Default is 18.

The s parameter indicates the maximum number of digits stored to the right of the decimal point. s must be a value from 0 to p. Default value is 0

5-17 bytes
numeric(p,s)	Fixed precision and scale numbers.
Allows numbers from -10^38 +1 to 10^38 –1.

The p parameter indicates the maximum total number of digits that can be stored (both to the left and to the right of the decimal point). p must be a value from 1 to 38. Default is 18.

The s parameter indicates the maximum number of digits stored to the right of the decimal point. s must be a value from 0 to p. Default value is 0

5-17 bytes
smallmoney	Monetary data from -214,748.3648 to 214,748.3647	4 bytes
money	Monetary data from -922,337,203,685,477.5808 to 922,337,203,685,477.5807	8 bytes
float(n)	Floating precision number data from -1.79E + 308 to 1.79E + 308.
The n parameter indicates whether the field should hold 4 or 8 bytes. float(24) holds a 4-byte field and float(53) holds an 8-byte field. Default value of n is 53.

4 or 8 bytes
real	Floating precision number data from -3.40E + 38 to 3.40E + 38	4 bytes
'''

# data data types:
'''
Data type	Description	Storage
datetime	From January 1, 1753 to December 31, 9999 with an accuracy of 3.33 milliseconds	8 bytes
datetime2	From January 1, 0001 to December 31, 9999 with an accuracy of 100 nanoseconds	6-8 bytes
smalldatetime	From January 1, 1900 to June 6, 2079 with an accuracy of 1 minute	4 bytes
date	Store a date only. From January 1, 0001 to December 31, 9999	3 bytes
time	Store a time only to an accuracy of 100 nanoseconds	3-5 bytes
datetimeoffset	The same as datetime2 with the addition of a time zone offset	8-10 bytes
timestamp	Stores a unique number that gets updated every time a row gets created or modified. The timestamp value is based upon an internal clock and does not correspond to real time. Each table may have only one timestamp variable
'''

# Other data types
'''
Data type	Description
sql_variant	Stores up to 8,000 bytes of data of various data types, except text, ntext, and timestamp
uniqueidentifier	Stores a globally unique identifier (GUID)
xml	Stores XML formatted data. Maximum 2GB
cursor	Stores a reference to a cursor used for database operations
table	Stores a result-set for later processing

'''

# Microsoft Access Data Types
'''
Data type	Description	Storage
Text	Use for text or combinations of text and numbers. 255 characters maximum
Memo	Memo is used for larger amounts of text. Stores up to 65,536 characters. Note: You cannot sort a memo field. However, they are searchable
Byte	Allows whole numbers from 0 to 255	1 byte
Integer	Allows whole numbers between -32,768 and 32,767	2 bytes
Long	Allows whole numbers between -2,147,483,648 and 2,147,483,647	4 bytes
Single	Single precision floating-point. Will handle most decimals	4 bytes
Double	Double precision floating-point. Will handle most decimals	8 bytes
Currency	Use for currency. Holds up to 15 digits of whole dollars, plus 4 decimal places. Tip: You can choose which countrys currency to use	8 bytes
AutoNumber	AutoNumber fields automatically give each record its own number, usually starting at 1	4 bytes
Date/Time	Use for dates and times	8 bytes
Yes/No	A logical field can be displayed as Yes/No, True/False, or On/Off. In code, use the constants True and False (equivalent to -1 and 0). Note: Null values are not allowed in Yes/No fields	1 bit
Ole Object	Can store pictures, audio, video, or other BLOBs (Binary Large OBjects)	up to 1GB
Hyperlink	Contain links to other files, including web pages
Lookup Wizard	Let you type a list of options, which can then be chosen from a drop-down list	4 bytes
'''



# QUICK REF
'''
SQL Statement	Syntax
AND / OR

SELECT column_name(s)
FROM table_name
WHERE condition
AND|OR condition

ALTER TABLE
ALTER TABLE table_name
ADD column_name datatype
or

ALTER TABLE table_name
DROP COLUMN column_name

AS (alias)
SELECT column_name AS column_alias
FROM table_name
or

SELECT column_name
FROM table_name  AS table_alias

BETWEEN
SELECT column_name(s)
FROM table_name
WHERE column_name
BETWEEN value1 AND value2

CREATE DATABASE
CREATE DATABASE database_name

CREATE TABLE
CREATE TABLE table_name
(
column_name1 data_type,
column_name2 data_type,
column_name3 data_type,
...
)
CREATE INDEX
CREATE INDEX index_name
ON table_name (column_name)
or

CREATE UNIQUE INDEX index_name
ON table_name (column_name)

CREATE VIEW
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition
DELETE	DELETE FROM table_name
WHERE some_column=some_value
or

DELETE
FROM table_name
(Note: Deletes the entire table!!)

DELETE * FROM table_name
(Note: Deletes the entire table!!)

DROP DATABASE
DROP DATABASE database_name

DROP INDEX
DROP INDEX table_name.index_name (SQL Server)
DROP INDEX index_name ON table_name (MS Access)
DROP INDEX index_name (DB2/Oracle)
ALTER TABLE table_name
DROP INDEX index_name (MySQL)

DROP TABLE
DROP TABLE table_name

EXISTS

IF EXISTS (SELECT * FROM table_name WHERE id = ?)
BEGIN
--do what needs to be done if exists
END
ELSE
BEGIN
--do what needs to be done if not
END

GROUP BY
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name

HAVING
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value

IN
SELECT column_name(s)
FROM table_name
WHERE column_name
IN (value1,value2,..)

INSERT INTO
INSERT INTO table_name
VALUES (value1, value2, value3,....)
or

INSERT INTO table_name
(column1, column2, column3,...)
VALUES (value1, value2, value3,....)

INNER JOIN
SELECT column_name(s)
FROM table_name1
INNER JOIN table_name2
ON table_name1.column_name=table_name2.column_name

LEFT JOIN
SELECT column_name(s)
FROM table_name1
LEFT JOIN table_name2
ON table_name1.column_name=table_name2.column_name

RIGHT JOIN
SELECT column_name(s)
FROM table_name1
RIGHT JOIN table_name2
ON table_name1.column_name=table_name2.column_name

FULL JOIN
SELECT column_name(s)
FROM table_name1
FULL JOIN table_name2
ON table_name1.column_name=table_name2.column_name

LIKE
SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern

ORDER BY
SELECT column_name(s)
FROM table_name
ORDER BY column_name [ASC|DESC]
SELECT	SELECT column_name(s)
FROM table_name

SELECT *
SELECT *
FROM table_name

SELECT DISTINCT
SELECT DISTINCT column_name(s)
FROM table_name

SELECT INTO
SELECT *
INTO new_table_name [IN externaldatabase]
FROM old_table_name
or

SELECT column_name(s)
INTO new_table_name [IN externaldatabase]
FROM old_table_name

SELECT TOP
SELECT TOP number|percent column_name(s)
FROM table_name

TRUNCATE TABLE
TRUNCATE TABLE table_name

UNION
SELECT column_name(s) FROM table_name1
UNION
SELECT column_name(s) FROM table_name2

UNION ALL
SELECT column_name(s) FROM table_name1
UNION ALL
SELECT column_name(s) FROM table_name2

UPDATE
UPDATE table_name
SET column1=value, column2=value,...
WHERE some_column=some_value

WHERE
SELECT column_name(s)
FROM table_name
WHERE column_name operator value
Source : https://www.w3schools.com/sql/sql_quickref.asp

'''
