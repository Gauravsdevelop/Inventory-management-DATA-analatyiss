CREATE DATABASE I_M_S_Real;
USE I_M_S_Real;


CREATE TABLE products (
    ProductID      INT AUTO_INCREMENT PRIMARY KEY,
    ProductName    VARCHAR(100) NOT NULL,
    SKU            VARCHAR(30) UNIQUE,
    Category       VARCHAR(50),
    Brand          VARCHAR(50),
    SupplierName   VARCHAR(100),
    Warehouse      VARCHAR(50) DEFAULT 'Jaipur Warehouse',
    Stock          INT NOT NULL DEFAULT 0,
    Price          DECIMAL(10,2) NOT NULL,
    CostPrice      DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    ReorderLevel   INT NOT NULL DEFAULT 10,
    TargetStock    INT NOT NULL DEFAULT 50,
    LastUpdated    TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE inventory_transactions (
    TransactionID       INT AUTO_INCREMENT PRIMARY KEY,
    ProductID           INT NOT NULL,
    TransactionType     ENUM('IN', 'OUT', 'ADJUSTMENT') NOT NULL,
    Quantity            INT NOT NULL,
    UnitCost            DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    ReferenceNo         VARCHAR(50),
    Department          VARCHAR(50),
    TransactionDate     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Remarks             VARCHAR(255),
    
    
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

SHOW TABLES;

USE I_M_S_Real;

INSERT INTO products
(ProductName, SKU, Category, Brand, SupplierName, Warehouse,
 Stock, Price, CostPrice, ReorderLevel, TargetStock)
VALUES
('Laptop', 'ELEC-001', 'Electronics', 'Dell', 'Dell Supplier', 'Jaipur Warehouse', 25, 60000, 48000, 10, 50),
('Mouse', 'ACC-001', 'Accessories', 'Logitech', 'Tech Supplier', 'Jaipur Warehouse', 8, 800, 500, 15, 60),
('Keyboard', 'ACC-002', 'Accessories', 'HP', 'Tech Supplier', 'Jaipur Warehouse', 30, 1500, 1000, 10, 50),
('Monitor', 'ELEC-002', 'Electronics', 'Samsung', 'Samsung Supplier', 'Delhi Warehouse', 12, 12000, 9000, 10, 30),
('Printer', 'ELEC-003', 'Electronics', 'Canon', 'Canon Supplier', 'Jaipur Warehouse', 0, 18000, 14000, 5, 20),
('USB Cable', 'ACC-003', 'Accessories', 'Portronics', 'Tech Supplier', 'Delhi Warehouse', 100, 250, 120, 20, 100),
('Webcam', 'ELEC-004', 'Electronics', 'Logitech', 'Tech Supplier', 'Jaipur Warehouse', 6, 3500, 2500, 10, 30),
('Office Chair', 'FURN-001', 'Furniture', 'Godrej', 'Furniture Supplier', 'Delhi Warehouse', 18, 8500, 6500, 5, 25),
('Desk', 'FURN-002', 'Furniture', 'IKEA', 'Furniture Supplier', 'Jaipur Warehouse', 4, 7000, 5200, 5, 20),
('Headphones', 'ACC-004', 'Accessories', 'Sony', 'Sony Supplier', 'Jaipur Warehouse', 40, 2200, 1500, 10, 50),
('Smartphone', 'ELEC-005', 'Electronics', 'Samsung', 'Mobile Supplier', 'Jaipur Warehouse', 35, 25000, 20000, 10, 50),
('Tablet', 'ELEC-006', 'Electronics', 'Apple', 'Apple Supplier', 'Delhi Warehouse', 14, 45000, 38000, 5, 25),
('Router', 'NET-001', 'Networking', 'TP-Link', 'Network Supplier', 'Jaipur Warehouse', 22, 3000, 2200, 8, 40),
('Switch', 'NET-002', 'Networking', 'Cisco', 'Network Supplier', 'Delhi Warehouse', 9, 6500, 5000, 10, 30),
('External Hard Drive', 'STO-001', 'Storage', 'Seagate', 'Storage Supplier', 'Jaipur Warehouse', 16, 5500, 4200, 5, 25),
('SSD 1TB', 'STO-002', 'Storage', 'Samsung', 'Storage Supplier', 'Delhi Warehouse', 28, 8000, 6200, 10, 40),
('RAM 16GB', 'COMP-001', 'Computer Parts', 'Kingston', 'Parts Supplier', 'Jaipur Warehouse', 45, 3500, 2700, 10, 60),
('Graphics Card', 'COMP-002', 'Computer Parts', 'NVIDIA', 'Parts Supplier', 'Delhi Warehouse', 7, 35000, 30000, 5, 20),
('Power Supply', 'COMP-003', 'Computer Parts', 'Corsair', 'Parts Supplier', 'Jaipur Warehouse', 19, 7500, 5800, 5, 30),
('Projector', 'ELEC-007', 'Electronics', 'Epson', 'Epson Supplier', 'Delhi Warehouse', 5, 28000, 23000, 5, 20),
('Scanner', 'ELEC-008', 'Electronics', 'Canon', 'Canon Supplier', 'Jaipur Warehouse', 11, 15000, 12000, 5, 25),
('Microphone', 'ACC-005', 'Accessories', 'JBL', 'Audio Supplier', 'Jaipur Warehouse', 32, 2800, 1900, 10, 50),
('Webcam HD', 'ELEC-009', 'Electronics', 'HP', 'Tech Supplier', 'Delhi Warehouse', 13, 4200, 3100, 5, 25),
('UPS', 'ELEC-010', 'Electronics', 'APC', 'Power Supplier', 'Jaipur Warehouse', 17, 9000, 7200, 5, 30),
('Barcode Scanner', 'ACC-006', 'Accessories', 'Zebra', 'Tech Supplier', 'Jaipur Warehouse', 3, 6500, 5000, 5, 20);


USE I_M_S_Real;

INSERT INTO inventory_transactions
(ProductID, TransactionType, Quantity, UnitCost, ReferenceNo, Department, Remarks)
VALUES
(1, 'IN', 10, 48000, 'PO-1001', 'IT', 'Laptop stock received'),
(1, 'OUT', 5, 48000, 'SO-1001', 'Sales', 'Laptop sold'),
(2, 'IN', 20, 500, 'PO-1002', 'Store', 'Mouse stock received'),
(2, 'OUT', 12, 500, 'SO-1002', 'Sales', 'Mouse sold'),
(3, 'IN', 15, 1000, 'PO-1003', 'Store', 'Keyboard received'),
(3, 'OUT', 8, 1000, 'SO-1003', 'Sales', 'Keyboard sold'),
(4, 'IN', 10, 9000, 'PO-1004', 'IT', 'Monitor received'),
(4, 'OUT', 4, 9000, 'SO-1004', 'Sales', 'Monitor sold'),
(5, 'IN', 10, 14000, 'PO-1005', 'IT', 'Printer received'),
(5, 'OUT', 10, 14000, 'SO-1005', 'Sales', 'Printer issued'),
(7, 'IN', 12, 2500, 'PO-1006', 'IT', 'Webcam received'),
(7, 'OUT', 6, 2500, 'SO-1006', 'Sales', 'Webcam sold'),
(10, 'IN', 20, 1500, 'PO-1007', 'Store', 'Headphones received'),
(10, 'OUT', 5, 1500, 'SO-1007', 'Sales', 'Headphones sold'),
(13, 'IN', 15, 2200, 'PO-1008', 'IT', 'Router received'),
(13, 'OUT', 3, 2200, 'SO-1008', 'IT', 'Router issued'),
(16, 'IN', 10, 6200, 'PO-1009', 'Store', 'SSD received'),
(16, 'OUT', 2, 6200, 'SO-1009', 'IT', 'SSD issued'),
(18, 'IN', 8, 30000, 'PO-1010', 'IT', 'Graphics card received'),
(18, 'OUT', 1, 30000, 'SO-1010', 'IT', 'Graphics card issued');
select * from products;
select * from inventory_transactions;