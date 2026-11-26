CREATE DATABASE IF NOT EXISTS event_management;
USE event_management;

CREATE TABLE IF NOT EXISTS venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS organizers (
    organizer_id INT PRIMARY KEY,
    organizer_name VARCHAR(255) NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL,
    venue_id INT NOT NULL,
    organizer_id INT NOT NULL,
    ticket_price DECIMAL(10,2) NOT NULL,
    total_seats INT NOT NULL,
    available_seats INT NOT NULL,
    FOREIGN KEY (venue_id) REFERENCES venues(venue_id),
    FOREIGN KEY (organizer_id) REFERENCES organizers(organizer_id)
);



CREATE TABLE IF NOT EXISTS attendees (
    attendee_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);




CREATE TABLE IF NOT EXISTS tickets (
    ticket_id INT PRIMARY KEY,
    event_id INT NOT NULL,
    attendee_id INT NOT NULL,
    booking_date DATE NOT NULL,
    status ENUM('Confirmed','Cancelled','Pending') NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (attendee_id) REFERENCES attendees(attendee_id),
    UNIQUE (event_id, attendee_id)
);

CREATE TABLE IF NOT EXISTS payments (
    payment_id INT PRIMARY KEY,
    ticket_id INT NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_status ENUM('Success','Failed','Pending') NOT NULL,
    payment_date DATETIME NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES tickets(ticket_id)
);

SHOW TABLES;



-- Queries 1 : Implement CURD Operations

INSERT INTO venues (venue_id,venue_name,location,capacity) VALUES
(1,'Grand Hall','Surat',500),
(2,'Conference Center','Pune',300),
(3,'Open Air Theater','Mumbai',1000),
(4,'Banquet Hall','Delhi',200),
(5,'Exhibition Center','Bangalore',800);

INSERT INTO organizers (organizer_id,organizer_name,contact_email,phone_number) VALUES
(1,'Event Masters','eventmaster@gmail.com','9876598769'),
(2,'Party Planners','partyplanners@gmail.com','9879898686'),
(3,'Conference Experts','conferenceexperts@gmail.com','9876543210'),
(4,'Music Mania','musicmania@gmail.com','9876543211'),
(5,'Wedding Wonders','weddingwonders@gmail.com','9876543212');

INSERT INTO events (event_id,event_name,event_date,venue_id,organizer_id,ticket_price,total_seats,available_seats) VALUES
(1,'Tech Conference 2024','2024-07-15',2,3,150.00,300,300),
(2,'Music Festival','2024-08-20',3,4,100.00,1000,1000),
(3,'Wedding Expo','2024-09-10',5,5,50.00,800,800),
(4,'Business Summit','2024-10-05',1,1,200.00,500,500),
(5,'Art Exhibition','2024-11-12',4,2,75.00,200,200);

INSERT INTO attendees (attendee_id,name,email,phone_number) VALUES
(1,'Joh','jon@gmail.com','9876543213'),
(2,'Smith','smith@gmail.com','9876543214'),
(3,'Amit','amit@gmail.com','9876543215'),
(4,'Ravi','ravi@gmail.com','9876543216'),
(5,'Priya','priya@gmail.com','9876543217');

INSERT INTO tickets (ticket_id,event_id,attendee_id,booking_date,status) VALUES
(1,1,1,'2024-06-01','Confirmed'),
(2,2,2,'2024-06-02','Confirmed'),
(3,3,3,'2024-06-03','Pending'),
(4,4,4,'2024-06-04','Cancelled'),
(5,5,5,'2024-06-05','Confirmed');

INSERT INTO payments (payment_id,ticket_id,amount_paid,payment_status,payment_date) VALUES
(1,1,150.00,'Success','2024-06-01 10:00:00'),
(2,2,100.00,'Success','2024-06-02 11:00:00'),
(3,3,50.00,'Pending','2024-06-03 12:00:00'),
(4,4,200.00,'Failed','2024-06-04 13:00:00'),
(5,5,75.00,'Success','2024-06-05 14:00:00');

SELECT * FROM venues;

SELECT * FROM organizers;

SELECT * FROM events;

SELECT * FROM attendees;

SELECT * FROM tickets;
SELECT * FROM payments;


-- Update

UPDATE organizers SET phone_number = '9876543218' WHERE organizer_id = 2;


UPDATE venues SET capacity = 600 WHERE venue_id = 1;

UPDATE organizers SET phone_number = '9999999999' WHERE organizer_id = 1;

UPDATE attendees SET name = 'Rahul Patel' WHERE attendee_id = 1;

UPDATE tickets SET status = 'Confirmed' WHERE ticket_id = 4;

UPDATE payments SET amount_paid = 1000,payment_status = 'Success' WHERE payment_id = 4;

SELECT * FROM venues;

SELECT * FROM organizers;

SELECT * FROM events;

SELECT * FROM attendees;

SELECT * FROM tickets;

SELECT * FROM payments;


INSERT INTO venues (venue_id,venue_name,location,capacity) VALUES
(6,'Skyline Terrace','Chennai',400);

-- Delete
DELETE FROM venues WHERE venue_id = 6;

DELETE FROM attendees WHERE attendee_id = 8;

DELETE FROM tickets WHERE ticket_id = 8;

DELETE FROM payments WHERE payment_id = 8;

SELECT * FROM venues;

SELECT * FROM organizers;

SELECT * FROM events;

SELECT * FROM attendees;

SELECT * FROM tickets;

SELECT * FROM payments;



-- Queries 2 : Use SQL Clauses (WHERE,HAVING,LIMIT)

SELECT * FROM events WHERE event_date >= CURDATE();

SELECT * FROM venues WHERE location = 'Surat';

SELECT * FROM events ORDER BY ticket_price DESC LIMIT 5;

SELECT * FROM attendees LIMIT 3;



-- Queries 3 : Apply SQL Operators (AND,OR,NOT)

SELECT * FROM events
WHERE MONTH(event_date) = 12 AND available_seats > total_seats / 2;

SELECT * FROM attendees
WHERE attendee_id IN (SELECT attendee_id FROM tickets)
OR attendee_id IN (
    SELECT t.attendee_id
    FROM tickets t
    JOIN payments p ON t.ticket_id = p.ticket_id
    WHERE p.payment_status = 'Pending'
);

SELECT * FROM events WHERE NOT (available_seats = 0);



-- Queries 4 : Sorting & Grouping Data (ORDER BY,GROUP BY)

SELECT * FROM events ORDER BY event_date ASC;

SELECT event_id,COUNT(attendee_id) AS total_attendees
FROM tickets
GROUP BY event_id;

SELECT t.event_id,SUM(p.amount_paid) AS total_revenue
FROM tickets t
JOIN payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY t.event_id;



-- Queries 5 : Use Aggregate Functions (SUM,AVG,MAX,MIN,COUNT)

SELECT SUM(amount_paid) AS total_revenue
FROM payments
WHERE payment_status = 'Success';

SELECT event_id,COUNT(attendee_id) AS total_attendees
FROM tickets
WHERE status = 'Confirmed'
GROUP BY event_id
ORDER BY total_attendees DESC
LIMIT 1;

SELECT AVG(ticket_price) AS average_ticket_price FROM events;

SELECT MAX(ticket_price) AS highest_ticket_price,MIN(ticket_price) AS lowest_ticket_price,COUNT(*) AS total_events
FROM events;



-- Queries 6 : Establish Primary & Foreign Key Relationship

DESC events;

DESC tickets;

DESC payments;




-- Queries 7 : Implement Joins

SELECT e.event_id,e.event_name,e.event_date,v.venue_name,v.location
FROM events e
INNER JOIN venues v ON e.venue_id = v.venue_id;

SELECT a.attendee_id,a.name,t.ticket_id,p.payment_status
FROM attendees a
LEFT JOIN tickets t ON a.attendee_id = t.attendee_id
LEFT JOIN payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status IS NULL OR p.payment_status <> 'Success';

SELECT e.event_id,e.event_name,t.ticket_id
FROM tickets t
RIGHT JOIN events e ON t.event_id = e.event_id
WHERE t.ticket_id IS NULL;

SELECT a.attendee_id,a.name,t.ticket_id
FROM attendees a
LEFT JOIN tickets t ON a.attendee_id = t.attendee_id
UNION
SELECT a.attendee_id,a.name,t.ticket_id
FROM attendees a
RIGHT JOIN tickets t ON a.attendee_id = t.attendee_id;

SELECT a.attendee_id,a.name
FROM attendees a
LEFT JOIN tickets t ON a.attendee_id = t.attendee_id
WHERE t.ticket_id IS NULL;



-- Queries 8 : Use Subqueries

SELECT * FROM events
WHERE ticket_price > (SELECT AVG(ticket_price) FROM events);

SELECT attendee_id,COUNT(DISTINCT event_id) AS total_events
FROM tickets
GROUP BY attendee_id
HAVING COUNT(DISTINCT event_id) > 1;

SELECT * FROM organizers
WHERE organizer_id IN (
    SELECT organizer_id
    FROM events
    GROUP BY organizer_id
    HAVING COUNT(event_id) > 3
);




-- Queries 9 : Implement Date & Time Functions

SELECT event_name,event_date,MONTH(event_date) AS event_month
FROM events;

SELECT event_name,DATEDIFF(event_date,CURDATE()) AS days_remaining
FROM events
WHERE event_date >= CURDATE();

SELECT payment_id,DATE_FORMAT(payment_date,'%Y-%m-%d %H:%i:%s') AS formatted_date
FROM payments;



-- Queries 10 : Use String Manipulation Functions

SELECT organizer_id,UPPER(organizer_name) AS organizer_name
FROM organizers;

SELECT attendee_id,TRIM(name) AS clean_name
FROM attendees;

SELECT attendee_id,name,IFNULL(email,'Not Provided') AS email
FROM attendees;



-- Queries 11 : Implement Window Functions

SELECT t.event_id,SUM(p.amount_paid) AS total_revenue,
RANK() OVER (ORDER BY SUM(p.amount_paid) DESC) AS event_rank
FROM tickets t
JOIN payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY t.event_id;

SELECT ticket_id,amount_paid,
SUM(amount_paid) OVER (ORDER BY ticket_id) AS cumulative_sales
FROM payments
WHERE payment_status = 'Success';

SELECT event_id,attendee_id,
COUNT(*) OVER (PARTITION BY event_id ORDER BY ticket_id) AS running_attendees
FROM tickets;



-- Queries 12 : Apply SQL CASE Expressions

SELECT event_name,available_seats,total_seats,
CASE
    WHEN available_seats < total_seats * 0.20 THEN 'High Demand'
    WHEN available_seats BETWEEN total_seats * 0.20 AND total_seats * 0.50 THEN 'Moderate Demand'
    ELSE 'Low Demand'
END AS demand_status
FROM events;

SELECT payment_id,payment_status,
CASE
    WHEN payment_status = 'Success' THEN 'Successful'
    WHEN payment_status = 'Failed' THEN 'Failed'
    ELSE 'Pending'
END AS status
FROM payments;
