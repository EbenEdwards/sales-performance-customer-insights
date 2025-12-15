-- Table creation for sales analytics project

CREATE TABLE regions (
    regionid INT PRIMARY KEY,
    regionname VARCHAR(100)
);

CREATE TABLE products (
    productid INT PRIMARY KEY,
    productname VARCHAR(150),
    category VARCHAR(100)
);

CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    customername VARCHAR(150),
    customertype VARCHAR(50),
    city VARCHAR(100),
    regionid INT
);

CREATE TABLE sales (
    saleid INT PRIMARY KEY,
    date DATE,
    customerid INT,
    productid INT,
    quantity INT,
    unitprice DECIMAL(10,2),
    discount DECIMAL(5,2),
    cost_per_unit DECIMAL(10,2),
    regionid INT
);

