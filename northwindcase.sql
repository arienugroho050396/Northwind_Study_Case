-- Change the query above so that “ProductName” appears as “Product”.
SELECT ProductName AS Product, UnitPrice, UnitsInStock, UnitPrice*UnitsInStock AS StockValue
FROM Products

-- Get	the	name	and	total	value	of	items	on	order	for	each	product.
SELECT ProductName, UnitPrice*UnitsOnOrder
FROM Products

-- Assume all the product on order have just arrived. Show how many of each product you now have.
SELECT ProductName, UnitsInStock + UnitsOnOrder AS TotalStock
FROM Products

-- Find a way show the value of the 20% sales tax on each product, using division, instead of by multiplying.
SELECT Unitprice/5
FROM Products

-- Find the answer to "seven times eight"
SELECT 7 * 8

-- Look at the Products table again. If you store all units (currently in stock) for each product in groups of twelve, show how many units of each product will be left over.
SELECT ProductName, (UnitsInStock + UnitsOnOrder) * UnitPrice
FROM Products

-- Change the query to include the customer contact name at the beginning of the result column. Follow the same format.
SELECT ContactName + ',' + Address + ',' + City
FROM Customers

-- Add title 'Name and Address' to the result column of the query in the last exercise.
SELECT ContactName + ',' + Address + ',' + City AS 'Name and Address'
FROM Customers

-- Get a list customer in Berlin
SELECT * 
FROM Customers
WHERE City = 'Berlin'

-- Get only contact names and phone numbers of customers in Berlin
SELECT ContactName, Phone
FROM Customers
WHERE City = 'Berlin'

-- Change the query above to show products with ten or more units in stock 
SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock >= 10

-- Show a list of products with current stock worth less than one-hundred.
SELECT * 
FROM Products
WHERE UnitsInStock * UnitsOnOrder < 100

-- Use a query to show a list of all product names beginning with "P"
SELECT ProductName
FROM Products 
WHERE ProductName LIKE 'P%'

-- List the records of all employees hired from 1993 onwards. 
SELECT *
FROM Employees
WHERE HireDate >= '1993-01-01'

-- Get a list of products with at least ten but less than twenty units in stock. show the stock levels in your results. 
SELECT ProductName, UnitsInStock 
FROM Products
WHERE UnitsInStock >= 10
AND UnitsInStock < 20

-- Get the records for orders shipped to Brazil from 1997 onwards.
SELECT * 
FROM Orders
WHERE OrderDate >= '1997-01-01'
AND ShipCountry = 'Brazil'

-- Get the orders shipped to Brazil in 1997 (you can use "AND" as many times as you like, just keep adding the operator followed by its condition to the end of your "WHERE" clause)
SELECT * 
FROM Orders
WHERE OrderDate >= '1997-01-01'
AND OrderDate < '1998-01-01'
AND ShipCountry = 'Brazil'

-- The UK sales team are visiting the seattle office: list the records of any employees you would now expect to be expect to be in Seattle.
SELECT *
FROM Employees
WHERE Country = 'UK'
OR City = 'Seattle'

-- Get a list of customers outside the USE (the "not equal to" operator is "<>").
SELECT * 
FROM Customers
WHERE Country <> 'USA'

-- Get a list of customers where your contact has a title beginning with "Sales" or "Marketing"
SELECT * 
FROM Customers
WHERE ContactTitle LIKE 'Sales%'
OR ContactTitle LIKE 'Marketing%'

-- Get a list of the names and numbers of your contacts outside of the US and Mexico, whose titles don't begin with 'Sales' or 'Marketing'
SELECT ContactName, Phone, ContactTitle, Country
FROM Customers
WHERE (Country <> 'USA' 
		AND Country <> 'Mexico')
AND NOT (ContactTitle LIKE 'Sales%'
		OR ContactTitle LIKE 'Marketing%')

-- List the countries in which your suppliers are based
SELECT DISTINCT *
FROM Suppliers

-- Group the products by category, then in ascending order of price per unit. show the product name, category ID and unit price in your results.
SELECT ProductName, CategoryID, UnitPrice
FROM Products
ORDER BY CategoryID, UnitPrice

-- List the names and prices of the ten cheapest products.
SELECT TOP 10 ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice

-- Find the total number of units you have in stock for discontinued products (these have a "1", meaning "true", in their "Discontinued" field)
SELECT SUM(UnitInStock)
FROM Products
WHERE Discontinued = 1

-- Get the total value of those units, for each supplier 
SELECT SupplierID, SUM(UnitsOnOrder * UnitPrice)
FROM Products
GROUP BY SupplierID

-- List the IDs categories with more than 100 units in stock. 
SELECT CategoryID, SUM(UnitsInStock)
FROM Products
GROUP BY CategoryID
HAVING SUM(UnitsInStock) > 100

-- Get a list of orders their cash values (before any discount) and the number of units they contain. Add your own column titles to the query result.
SELECT OrderID, SUM(Quantity * UnitPrice) AS CashValue, SUM(Quantity) AS Units
FROM [Order Details]
GROUP BY OrderID

-- Return a list of products and their category names. Include all columns from the products table and only the category name column from the categories table.
SELECT c.CategoryName, p.*
FROM Products p 
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID

-- Use SQL to calculate how many combinations of rows there would be if the Shippers and Customers tables were cross-joined
SELECT (
SELECT COUNT(*)
FROM Shippers
)*(
SELECT COUNT(*)
FROM Customers
)

-- Make a query which returns a list of products in the seafood category
SELECT *
FROM Products
WHERE CategoryID IN
(
	SELECT CategoryID
	FROM Categories
	WHERE CategoryName = 'Seafood'
)

-- Can you alter the "ALL" query to return the record for the cheapest product?
SELECT *
FROM Products
WHERE UnitPrice <= ALL
(
	SELECT UnitPrice
	FROM Products
)

-- Return all the rows of the table, apart from the one for the most expensive product. 
SELECT *
FROM Products
WHERE UnitPrice < ANY
(
	SELECT UnitPrice
	FROM Products
)


















