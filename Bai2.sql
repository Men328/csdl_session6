CREATE DATABASE saleDB;

CREATE TABLE customers (
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE promotions (
	promotionID INT PRIMARY KEY AUTO_INCREMENT,
    promotionName VARCHAR(100) NOT NULL,
    discountPercentage DECIMAL(10,2) NOT NULL
);

CREATE TABLE products (
	productID INT PRIMARY KEY NOT NULL,
    productName VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    promotionID INT,
    FOREIGN KEY (promotionID) REFERENCES promotions(promotionID)
);

CREATE TABLE orders (
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID),
    orderDate DATE,
    TotalAmount DECIMAL(10,2) NOT NULL
);

CREATE TABLE orderDetails (
	orderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NOT NULL,
    FOREIGN KEY(orderID) REFERENCES orders(orderID),
    productID INT NOT NULL,
    FOREIGN KEY(productID) REFERENCES products(productID),
    quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE sales (
    saleID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT,
    FOREIGN KEY (orderID)
        REFERENCES orders (orderID),
    saleDate DATE,
    saleAmount DECIMAL(10 , 2 ) NOT NULL
);

INSERT INTO customers (customerID, firstName, lastName, email) VALUES
(1, 'ngọc', 'anh', 'ngocanh@gmail.com'),
(2, 'minh', 'trọng', 'minhtrong@gmail.com'),
(3, 'cẩm', 'tú', 'camtu@gmail.com'),
(4, 'huyền', 'trang', 'huyentrang@gmail.com');

INSERT INTO orders (orderID, customerID, orderDate, TotalAmount) VALUES
(1, 1, '2024-01-15', 150.75),
(2, 2, '2024-01-16', 200.00),
(3, 3, '2024-01-17', 99.99),
(4, 1, '2024-01-18', 50.50);

DELIMITER $$
CREATE PROCEDURE AddNewCustomer(IN inFirstName VARCHAR(50), 
IN inLastName VARCHAR(50), IN inEmail VARCHAR(100))
BEGIN
	INSERT INTO customers (FirstName, LastName, Email)
    VALUES (inFirstName, inLastName, inEmail);
END$$
DELIMITER ;

CALL AddNewCustomer('tran', 'men', 'tranmen@gmail.com');
SELECT * FROM customers






