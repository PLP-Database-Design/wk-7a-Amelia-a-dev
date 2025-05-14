-- ====================================================
-- Question 1: Achieving First Normal Form (1NF)
-- ====================================================
-- Problem: The 'Products' column contains multiple values,
-- which violates 1NF.
-- Solution: Decompose into rows so each row contains one product.

-- Creating a new table in 1NF format
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Inserting individual product records (1NF achieved)
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ====================================================
-- Question 2: Achieving Second Normal Form (2NF)
-- ====================================================
-- Problem: The 'CustomerName' column depends only on OrderID,
-- not on the entire primary key (OrderID + Product),
-- which violates 2NF due to partial dependency.
-- Solution: Split into two tables: Orders and OrderProducts.

-- Table 1: Orders (stores OrderID and CustomerName only)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Inserting values into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Table 2: OrderProducts (stores OrderID, Product, and Quantity)
-- Foreign key used to link back to Orders table
CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting values into OrderProducts table
INSERT INTO OrderProducts (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
