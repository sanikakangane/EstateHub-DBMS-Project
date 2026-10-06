-- EstateHub.sql
-- Real Estate Property Listing & Enquiry Management System
-- PostgreSQL

CREATE DATABASE estatehub_db;

-- Connect before running the remaining commands:
-- \c estatehub_db

CREATE TABLE agent (
    agentid INTEGER PRIMARY KEY NOT NULL,
    agentname VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE buyer (
    buyerid INTEGER PRIMARY KEY NOT NULL,
    buyername VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE location (
    locationid INTEGER PRIMARY KEY NOT NULL,
    city VARCHAR(100) NOT NULL,
    pincode VARCHAR(10) NOT NULL
);

CREATE TABLE owner (
    ownerid INTEGER PRIMARY KEY NOT NULL,
    ownername VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE property (
    propertyid INTEGER PRIMARY KEY NOT NULL,
    propertytype VARCHAR(50) NOT NULL,
    price NUMERIC(12,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    ownerid INTEGER NOT NULL REFERENCES owner(ownerid),
    locationid INTEGER NOT NULL REFERENCES location(locationid),
    agentid INTEGER NOT NULL REFERENCES agent(agentid)
);

CREATE TABLE buyerpropertyenquiry (
    enquiryid INTEGER PRIMARY KEY NOT NULL,
    buyerid INTEGER NOT NULL REFERENCES buyer(buyerid),
    propertyid INTEGER NOT NULL REFERENCES property(propertyid),
    enquirydate DATE NOT NULL,
    message TEXT,
    followupstatus VARCHAR(30) NOT NULL,
    followupdate DATE
);

INSERT INTO agent VALUES
(1, 'Aarav Shah', '9988776655', 'aarav@estatehub.com'),
(2, 'Sneha Kulkarni', '9988776656', 'sneha@estatehub.com'),
(3, 'Vikram Singh', '9988776657', 'vikram@estatehub.com'),
(4, 'Pooja Nair', '9988776658', 'pooja@estatehub.com'),
(5, 'Karan Gupta', '9988776659', 'karan@estatehub.com');

INSERT INTO buyer VALUES
(1, 'Ananya Kapoor', '9123456780', 'ananya@example.com'),
(2, 'Rahul Verma', '9123456781', 'rahul@example.com'),
(3, 'Isha Patil', '9123456782', 'isha@example.com'),
(4, 'Arjun Mehta', '9123456783', 'arjun@example.com'),
(5, 'Meera Joshi', '9123456784', 'meera@example.com'),
(6, 'Aditya Shah', '9123456785', 'aditya@example.com');

INSERT INTO location VALUES
(1, 'Mumbai', '400001'),
(2, 'Thane', '400601'),
(3, 'Navi Mumbai', '400614'),
(4, 'Pune', '411001'),
(5, 'Nashik', '422001');

INSERT INTO owner VALUES
(1, 'Rajesh Sharma', '9876543210', 'rajesh@example.com'),
(2, 'Priya Mehta', '9876543211', 'priya@example.com'),
(3, 'Amit Patil', '9876543212', 'amit@example.com'),
(4, 'Neha Joshi', '9876543213', 'neha@example.com'),
(5, 'Rohan Deshmukh', '9876543214', 'rohan@example.com');

INSERT INTO property VALUES
(1, 'Apartment', 8500000, 'Available', 1, 1, 1),
(2, 'Villa', 15000000, 'Available', 2, 2, 2),
(3, 'Apartment', 6500000, 'Sold', 3, 3, 3),
(4, 'Plot', 4500000, 'Available', 4, 4, 4),
(5, 'Apartment', 7200000, 'Pending', 5, 5, 5),
(6, 'Villa', 18000000, 'Available', 1, 1, 2),
(7, 'Apartment', 5500000, 'Available', 2, 3, 3),
(8, 'Plot', 9000000, 'Sold', 3, 2, 4),
(9, 'Apartment', 6800000, 'Available', 4, 4, 1),
(10, 'Villa', 12500000, 'Available', 5, 1, 5);

INSERT INTO buyerpropertyenquiry VALUES
(1, 1, 1, '2026-09-01', 'Interested in property details', 'Contacted', '2026-09-02'),
(2, 2, 2, '2026-09-03', 'Requested a site visit', 'Pending', NULL),
(3, 3, 4, '2026-09-05', 'Interested in plot dimensions', 'Contacted', '2026-09-06'),
(4, 4, 6, '2026-09-07', 'Requested villa photos', 'Pending', NULL),
(5, 5, 7, '2026-09-10', 'Asked about payment options', 'Completed', '2026-09-11'),
(6, 6, 9, '2026-09-12', 'Interested in location details', 'Contacted', '2026-09-13'),
(7, 1, 10, '2026-09-15', 'Requested a property visit', 'Pending', NULL),
(8, 3, 1, '2026-09-18', 'Asked about parking facility', 'Completed', '2026-09-19');

SELECT * FROM property WHERE status = 'Available';

SELECT p.*
FROM property p
JOIN location l ON p.locationid = l.locationid
WHERE l.city = 'Mumbai' AND p.status = 'Available';

SELECT p.*
FROM property p
JOIN location l ON p.locationid = l.locationid
WHERE l.city = 'Mumbai'
AND p.price BETWEEN 5000000 AND 10000000
AND p.status = 'Available'
ORDER BY p.price;

SELECT COUNT(*) AS total_properties FROM property;

SELECT AVG(price) AS average_price FROM property;

SELECT p.propertyid, p.propertytype, p.price,
    o.ownername, o.phone, o.email
FROM property p
JOIN owner o ON p.ownerid = o.ownerid
ORDER BY p.propertyid;

SELECT p.propertyid, p.propertytype, p.price, p.status,
    a.agentname, a.phone, a.email
FROM property p
JOIN agent a ON p.agentid = a.agentid
ORDER BY p.propertyid;

SELECT e.enquiryid, b.buyername, p.propertyid, p.propertytype,
    e.enquirydate, e.message, e.followupstatus, e.followupdate
FROM buyerpropertyenquiry e
JOIN buyer b ON e.buyerid = b.buyerid
JOIN property p ON e.propertyid = p.propertyid
ORDER BY e.enquirydate;

SELECT l.city, COUNT(p.propertyid) AS total_properties
FROM location l
LEFT JOIN property p ON l.locationid = p.locationid
GROUP BY l.locationid, l.city
ORDER BY total_properties DESC;

SELECT status, COUNT(*) AS total_properties
FROM property
GROUP BY status;

SELECT a.agentname, COUNT(p.propertyid) AS total_properties
FROM agent a
LEFT JOIN property p ON a.agentid = p.agentid
GROUP BY a.agentid, a.agentname
ORDER BY total_properties DESC;

CREATE VIEW AvailableListings AS
SELECT p.propertyid, p.propertytype, p.price, p.status,
    o.ownername, l.city, l.pincode,
    a.agentname, a.phone AS agentphone, a.email AS agentemail
FROM property p
JOIN owner o ON p.ownerid = o.ownerid
JOIN location l ON p.locationid = l.locationid
JOIN agent a ON p.agentid = a.agentid
WHERE p.status = 'Available';

SELECT * FROM AvailableListings;

SELECT l.city, COUNT(p.propertyid) AS total_properties
FROM location l
JOIN property p ON l.locationid = p.locationid
GROUP BY l.city
HAVING COUNT(p.propertyid) > 1
ORDER BY total_properties DESC;
