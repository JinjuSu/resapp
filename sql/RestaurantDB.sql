-- Create the Tables table
CREATE TABLE Tables (
    TableID INT AUTO_INCREMENT PRIMARY KEY,
    Capacity INT NOT NULL
);

-- Create the Menu table
CREATE TABLE Menu (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Category VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
        Image VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    ImagePath VARCHAR(100) NOT NULL,
);

-- Create the Reservation table
CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    TableID INT,
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    Timestamp DATETIME NOT NULL,
    TableID INT,
    Items JSON,
    Total DECIMAL(10, 2) NOT NULL,
    PaymentDetails JSON,
    OrderStatus VARCHAR(50) NOT NULL,
    FOREIGN KEY (TableID) REFERENCES Tables(TableID)
);