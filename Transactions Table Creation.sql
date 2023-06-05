-- The query below creates the table
CREATE TABLE Transactions (
First_Name VARCHAR(200),
Last_Name VARCHAR(200),
Purchase INT,
Discount FLOAT(53),
Discount_Reason VARCHAR(200)
);

-- The query below populates the table by inserting records
INSERT INTO Transactions (First_Name, Last_Name, Purchase, Discount, Discount_Reason)
VALUES ('Christina', 'Bexar', 800, 0, NULL),
('Fiona', 'Ha', 1900, 100, 'Large Purchase'), 
('Dan', 'Johanes', 10, 0, NULL),
('Luke', 'John', 500, 100, 'Promotion'),
('Ahmad', 'Gupta', 1300, 100, 'Charity'),
('Diane', 'Casada', 800, 20, 'Promotion'),
('Jair', 'Gonzalez', 800, 12, 'Promotion'),
('Hector', 'Smith', 2100, 110, 'Large Purchase'),
('Monica', 'Smith', 4000, 200, 'Charity'),
('Kaleb', 'Munster', 3000, 150, 'Large Purchase'),
('Veronica', 'Dali', 90, 0, NULL);
