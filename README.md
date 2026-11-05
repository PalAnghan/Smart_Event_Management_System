::: {align="center"}
`<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F2027,50:203A43,100:2C5364&height=210&section=header&text=Smart%20Event%20Management%20System&fontSize=34&fontColor=ffffff&fontAlignY=38&desc=MySQL%20%7C%20SQL%20Practical%20Project&descAlignY=60&descSize=16" width="100%" alt="Smart Event Management System banner" />`{=html}

`<br/>`{=html}

`<a href="https://github.com/PalAnghan">`{=html}
`<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=19&duration=3000&pause=900&color=36BCF7&center=true&vCenter=true&width=650&lines=Hello%2C+I'm+Pal+Anghan+%F0%9F%91%8B;SQL+%26+Database+Development;Learning+by+Building+Real+Projects" alt="Animated introduction" />`{=html}
`</a>`{=html}

`<br/>`{=html}

`<img src="https://img.shields.io/badge/MySQL-8.0%2B-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />`{=html}
`<img src="https://img.shields.io/badge/SQL-Database-025E8C?style=for-the-badge&logo=databricks&logoColor=white" alt="SQL" />`{=html}
`<img src="https://img.shields.io/badge/Project-Final%20Practical-16A34A?style=for-the-badge" alt="Final practical project" />`{=html}
`<img src="https://img.shields.io/badge/Status-Completed-2563EB?style=for-the-badge" alt="Project status" />`{=html}

`<br/>`{=html}`<br/>`{=html}

`<a href="#-overview">`{=html}Overview`</a>`{=html} •
`<a href="#-features">`{=html}Features`</a>`{=html} •
`<a href="#-database-design">`{=html}Database Design`</a>`{=html} •
`<a href="#-sql-concepts-covered">`{=html}SQL Concepts`</a>`{=html} •
`<a href="#-getting-started">`{=html}Getting Started`</a>`{=html} •
`<a href="#-developer">`{=html}Developer`</a>`{=html}
:::

------------------------------------------------------------------------

## 📌 Overview

**Smart Event Management System** is a relational database project
developed using **MySQL** for my final practical examination.

It provides a structured way to store and manage event-related
information, including venues, organizers, attendees, ticket bookings,
and payments. The project demonstrates practical SQL skills through
database relationships, CRUD operations, joins, subqueries, aggregate
functions, date and string functions, window functions, and `CASE`
expressions.

> **Project focus:** Database design, data management, and SQL query
> practice.

## ✨ Features

-   **Event records** --- Store event names, dates, ticket prices, and
    seat details.
-   **Venue management** --- Maintain venue names, locations, and
    capacities.
-   **Organizer records** --- Store organizer names and contact
    information.
-   **Attendee records** --- Maintain attendee contact details.
-   **Ticket bookings** --- Connect attendees with events and store
    booking dates and statuses.
-   **Payment tracking** --- Store payment amounts, dates, and payment
    statuses.
-   **SQL reporting** --- Retrieve useful information using joins,
    grouping, aggregate functions, and subqueries.
-   **Advanced SQL practice** --- Apply window functions and conditional
    `CASE` expressions.

## 🧰 Tech Stack

  Tool / Technology          Use
  -------------------------- -------------------------------------------------
  MySQL                      Relational database
  SQL                        Database creation, data operations, and queries
  Visual Studio Code         SQL script editing
  MySQL extension / client   Running SQL statements

## 🗃️ Database Design

The database is named `event_management` and contains **6 related
tables**.

  -----------------------------------------------------------------------
  Table                               Main purpose
  ----------------------------------- -----------------------------------
  `venues`                            Venue name, location, and capacity

  `organizers`                        Organizer name and contact details

  `events`                            Event date, venue, organizer,
                                      ticket price, and seat counts

  `attendees`                         Attendee name and contact details

  `tickets`                           Event booking, attendee, booking
                                      date, and booking status

  `payments`                          Ticket payment amount, status, and
                                      payment date
  -----------------------------------------------------------------------

### Entity Relationship Diagram

``` mermaid
erDiagram
    VENUES ||--o{ EVENTS : hosts
    ORGANIZERS ||--o{ EVENTS : manages
    EVENTS ||--o{ TICKETS : includes
    ATTENDEES ||--o{ TICKETS : books
    TICKETS ||--o{ PAYMENTS : receives

    VENUES {
        int venue_id PK
        varchar venue_name
        varchar location
        int capacity
    }

    ORGANIZERS {
        int organizer_id PK
        varchar organizer_name
        varchar contact_email
        varchar phone_number
    }

    EVENTS {
        int event_id PK
        varchar event_name
        date event_date
        int venue_id FK
        int organizer_id FK
        decimal ticket_price
        int total_seats
        int available_seats
    }

    ATTENDEES {
        int attendee_id PK
        varchar name
        varchar email
        varchar phone_number
    }

    TICKETS {
        int ticket_id PK
        int event_id FK
        int attendee_id FK
        date booking_date
        varchar status
    }

    PAYMENTS {
        int payment_id PK
        int ticket_id FK
        decimal amount_paid
        varchar payment_status
        datetime payment_date
    }
```

### Relationship Summary

-   One venue can host multiple events.
-   One organizer can manage multiple events.
-   One event can have multiple ticket bookings.
-   One attendee can book tickets for multiple events.
-   A ticket can be associated with payment records.

## 📚 SQL Concepts Covered

The project script is organized around these **12 practical topics**.

  ------------------------------------------------------------------------
                            \# Topic                 SQL concepts
  ---------------------------- --------------------- ---------------------
                            01 CRUD Operations       `INSERT`, `SELECT`,
                                                     `UPDATE`, `DELETE`

                            02 SQL Clauses           `WHERE`, `HAVING`,
                                                     `LIMIT`

                            03 SQL Operators         `AND`, `OR`, `NOT`,
                                                     `IN`

                            04 Sorting & Grouping    `ORDER BY`,
                                                     `GROUP BY`

                            05 Aggregate Functions   `SUM()`, `AVG()`,
                                                     `MAX()`, `MIN()`,
                                                     `COUNT()`

                            06 Key Relationships     Primary key, foreign
                                                     key, unique
                                                     constraint

                            07 Joins                 `INNER`, `LEFT`,
                                                     `RIGHT`,
                                                     `FULL OUTER JOIN`
                                                     equivalent

                            08 Subqueries            Nested `SELECT`,
                                                     `IN`, aggregate
                                                     subqueries

                            09 Date & Time Functions `MONTH()`,
                                                     `DATEDIFF()`,
                                                     `CURDATE()`,
                                                     `DATE_FORMAT()`

                            10 String Functions      `UPPER()`, `TRIM()`,
                                                     `IFNULL()`

                            11 Window Functions      `RANK()`,
                                                     `SUM() OVER()`,
                                                     `COUNT() OVER()`

                            12 CASE Expressions      Conditional event
                                                     demand and payment
                                                     labels
  ------------------------------------------------------------------------

## 💻 Sample SQL Queries

### 1. Display all events

``` sql
SELECT * FROM events;
```

### 2. Find the average ticket price

``` sql
SELECT AVG(ticket_price) AS average_ticket_price
FROM events;
```

### 3. Show events with their venue details

``` sql
SELECT e.event_name, v.venue_name, v.location
FROM events e
INNER JOIN venues v
ON e.venue_id = v.venue_id;
```

### 4. Find events priced above the average ticket price

``` sql
SELECT *
FROM events
WHERE ticket_price > (
    SELECT AVG(ticket_price)
    FROM events
);
```

### 5. Rank events by successful payment revenue

``` sql
SELECT t.event_id,
       SUM(p.amount_paid) AS total_revenue,
       RANK() OVER (
           ORDER BY SUM(p.amount_paid) DESC
       ) AS event_rank
FROM tickets t
JOIN payments p
ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY t.event_id;
```

## 🚀 Getting Started

### Requirements

-   MySQL Server 8.0 or later.
-   Visual Studio Code with a MySQL extension, MySQL Workbench, or
    another MySQL client.
-   Git (optional, for cloning the repository).

### 1. Clone the repository

``` bash
git clone https://github.com/PalAnghan/Smart_Event_Management_System.git
```

### 2. Open the project

Open the downloaded folder in Visual Studio Code.

### 3. Run the SQL file

Open `event_management.sql`, connect to your MySQL server, and execute
the script.

### 4. Verify the database

``` sql
USE event_management;
SHOW TABLES;
```

## 📂 Project Structure

``` text
Smart_Event_Management_System/
│
├── event_management.sql
└── README.md
```

## 🧠 What I Practised

-   Designing a relational database with multiple connected tables.
-   Creating tables and inserting sample records.
-   Applying primary key, foreign key, and unique constraints.
-   Writing SQL queries for filtering and reporting.
-   Combining tables with different types of joins.
-   Using aggregate functions and subqueries.
-   Applying date, string, and conditional functions.
-   Analysing query results with window functions.

## ⚠️ Note About Sample Dates

The sample event dates shown in the project data are in **2024**.
Queries that check for upcoming events using `CURDATE()` may return no
rows when run after those dates. This is expected with the existing
sample data. Update the sample dates if you want to test upcoming-event
queries.

## 👨‍💻 Developer

::: {align="center"}
`<a href="https://github.com/PalAnghan">`{=html}
`<img src="https://github-readme-stats.vercel.app/api?username=PalAnghan&show_icons=true&theme=tokyonight&hide_border=true&rank_icon=github" height="155" alt="Pal Anghan GitHub statistics" />`{=html}
`</a>`{=html}
`<a href="https://github.com/PalAnghan?tab=repositories">`{=html}
`<img src="https://github-readme-stats.vercel.app/api/top-langs/?username=PalAnghan&layout=compact&theme=tokyonight&hide_border=true" height="155" alt="Most used languages" />`{=html}
`</a>`{=html}

`<br/>`{=html}

`<a href="https://github.com/PalAnghan">`{=html}
`<img src="https://img.shields.io/badge/GitHub-PalAnghan-181717?style=for-the-badge&logo=github" alt="GitHub profile" />`{=html}
`</a>`{=html}

**Pal Anghan**\
*BCA Graduate \| Aspiring Developer \| Building with SQL, Python & Web
Technologies*
:::

------------------------------------------------------------------------

::: {align="center"}
**If you find this project useful, consider giving it a ⭐ on GitHub.**

Made with 💙 and SQL.
:::
