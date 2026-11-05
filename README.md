::: {align="center"}
# 🎟️ Smart Event Management System

### A MySQL database project for managing events, venues, organizers, attendees, tickets, and payments.

```{=html}
<p>
```
`<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&pause=1000&color=36BCF7&center=true&vCenter=true&width=650&lines=Built+with+MySQL;Designed+for+SQL+Practical+Examination;12+SQL+Topics+%7C+Real+Database+Relationships" alt="Animated typing banner" />`{=html}
```{=html}
</p>
```
```{=html}
<p>
```
`<img src="https://img.shields.io/badge/Database-MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL" />`{=html}
`<img src="https://img.shields.io/badge/Language-SQL-025E8C?style=for-the-badge&logo=databricks&logoColor=white" alt="SQL" />`{=html}
`<img src="https://img.shields.io/badge/Project-Final%20Practical-success?style=for-the-badge" alt="Final practical project" />`{=html}
```{=html}
</p>
```
```{=html}
<p>
```
`<a href="#-project-overview">`{=html}Overview`</a>`{=html} •
`<a href="#-database-schema">`{=html}Database Schema`</a>`{=html} •
`<a href="#-sql-topics-covered">`{=html}SQL Topics`</a>`{=html} •
`<a href="#-how-to-run">`{=html}How to Run`</a>`{=html}
```{=html}
</p>
```
:::

------------------------------------------------------------------------

## 📌 Project Overview

**Smart Event Management System** is a database project developed using
**MySQL** as part of my final practical examination.

The database is designed to help manage event information and the
related records for venues, organizers, attendees, ticket bookings, and
payments. It demonstrates how relational tables work together using
primary keys, foreign keys, joins, subqueries, aggregate functions, and
other SQL features.

## 🎯 Project Objectives

-   Manage event and venue information.
-   Store organizer and attendee details.
-   Maintain ticket booking records.
-   Track payment amounts and payment statuses.
-   Generate useful reports using SQL queries.
-   Practise database relationships and SQL concepts.

## 🧰 Technology Used

  Technology           Purpose
  -------------------- -------------------------------------
  MySQL                Relational database management
  SQL                  Creating tables and querying data
  Visual Studio Code   Writing and managing the SQL script

## 🗂️ Database Schema

The database name is `event_management` and it contains **6 tables**.

  Table          Purpose
  -------------- --------------------------------------------------
  `venues`       Stores venue name, location, and capacity
  `organizers`   Stores organizer contact details
  `events`       Stores event details, dates, prices, and seats
  `attendees`    Stores attendee contact details
  `tickets`      Stores event bookings and booking status
  `payments`     Stores ticket payment details and payment status

### 🔗 Table Relationships

``` mermaid
erDiagram
    VENUES ||--o{ EVENTS : hosts
    ORGANIZERS ||--o{ EVENTS : manages
    EVENTS ||--o{ TICKETS : has
    ATTENDEES ||--o{ TICKETS : books
    TICKETS ||--o{ PAYMENTS : has

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

## 📚 SQL Topics Covered

This project covers the following 12 practical topics:

```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}01 --- CRUD Operations`</strong>`{=html}
```{=html}
</summary>
```
-   `INSERT` --- Add records.
-   `SELECT` --- Retrieve records.
-   `UPDATE` --- Modify records.
-   `DELETE` --- Remove records.

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}02 --- SQL Clauses`</strong>`{=html}
```{=html}
</summary>
```
-   `WHERE`
-   `HAVING`
-   `LIMIT`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}03 --- SQL Operators`</strong>`{=html}
```{=html}
</summary>
```
-   `AND`
-   `OR`
-   `NOT`
-   `IN`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}04 --- Sorting & Grouping`</strong>`{=html}
```{=html}
</summary>
```
-   `ORDER BY`
-   `GROUP BY`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}05 --- Aggregate Functions`</strong>`{=html}
```{=html}
</summary>
```
-   `SUM()`
-   `AVG()`
-   `MAX()`
-   `MIN()`
-   `COUNT()`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}06 --- Primary Key & Foreign Key`</strong>`{=html}
```{=html}
</summary>
```
-   Primary key constraints.
-   Foreign key relationships.
-   Unique constraint for an attendee's event booking.

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}07 --- SQL Joins`</strong>`{=html}
```{=html}
</summary>
```
-   `INNER JOIN`
-   `LEFT JOIN`
-   `RIGHT JOIN`
-   `FULL OUTER JOIN` equivalent using `UNION`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}08 --- Subqueries`</strong>`{=html}
```{=html}
</summary>
```
-   Scalar subquery with `AVG()`.
-   Grouped subqueries using `GROUP BY` and `HAVING`.
-   `IN` with a subquery.

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}09 --- Date & Time Functions`</strong>`{=html}
```{=html}
</summary>
```
-   `MONTH()`
-   `DATEDIFF()`
-   `CURDATE()`
-   `DATE_FORMAT()`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}10 --- String Functions`</strong>`{=html}
```{=html}
</summary>
```
-   `UPPER()`
-   `TRIM()`
-   `IFNULL()`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}11 --- Window Functions`</strong>`{=html}
```{=html}
</summary>
```
-   `RANK()`
-   `SUM() OVER()`
-   `COUNT() OVER()`
-   `PARTITION BY`

```{=html}
</details>
```
```{=html}
<details>
```
```{=html}
<summary>
```
`<strong>`{=html}12 --- CASE Expressions`</strong>`{=html}
```{=html}
</summary>
```
-   Categorize event demand based on available seats.
-   Display readable payment status labels.

```{=html}
</details>
```
## ▶️ How to Run

### Prerequisites

-   MySQL Server 8.0 or later.
-   MySQL Workbench, VS Code with a MySQL extension, or another MySQL
    client.

### Steps

1.  Clone this repository:

    ``` bash
    git clone https://github.com/PalAnghan/Smart_Event_Management_System.git
    ```

2.  Open the project folder in VS Code or your preferred SQL editor.

3.  Open `event_management.sql`.

4.  Connect to your MySQL server.

5.  Execute the SQL script.

6.  Select the database and check the tables:

    ``` sql
    USE event_management;
    SHOW TABLES;
    ```

## 📁 Project Structure

``` text
Smart_Event_Management_System/
│
├── event_management.sql
└── README.md
```

## 📊 Example Queries

**1. Display all events**

``` sql
SELECT * FROM events;
```

**2. Find the average ticket price**

``` sql
SELECT AVG(ticket_price) AS average_ticket_price
FROM events;
```

**3. Display event details with venue information**

``` sql
SELECT e.event_name, v.venue_name, v.location
FROM events e
INNER JOIN venues v
ON e.venue_id = v.venue_id;
```

**4. Rank events by successful payment revenue**

``` sql
SELECT t.event_id,
       SUM(p.amount_paid) AS total_revenue,
       RANK() OVER (ORDER BY SUM(p.amount_paid) DESC) AS event_rank
FROM tickets t
JOIN payments p ON t.ticket_id = p.ticket_id
WHERE p.payment_status = 'Success'
GROUP BY t.event_id;
```

## ⚠️ Important Note About Sample Data

The sample event and booking dates in the SQL script are from **2024**.
Therefore, queries that use `CURDATE()` to find upcoming events or
remaining days may return no rows when run after those dates. This is
expected for the supplied sample data. Update the sample dates if you
want to test upcoming-event results.

## 🎓 Learning Outcomes

Through this practical project, I practised:

-   Designing a relational database with multiple connected tables.
-   Creating and managing tables using SQL.
-   Applying primary key, foreign key, and unique constraints.
-   Writing queries for reports and data analysis.
-   Using joins, subqueries, aggregate functions, and window functions.
-   Working with date, string, and conditional SQL functions.

## 👨‍💻 Author

**Pal Anghan**

GitHub: [@PalAnghan](https://github.com/PalAnghan)

------------------------------------------------------------------------

::: {align="center"}
### ⭐ Thank you for checking out my project!

*Created as part of my final practical examination.*
:::
