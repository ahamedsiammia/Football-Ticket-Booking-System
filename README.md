# 🎟️ Football Ticket Booking System

A SQL-based project that demonstrates relational database design and query solving for a football ticket booking system.

---

## 📌 Project Overview

This project covers:
- Relational database schema design with Foreign Keys
- 7 SQL queries solved on real booking data
- 3 interview-style conceptual questions answered

---

## 🗂️ Database Diagram

![Database Diagram](https://i.postimg.cc/MT0zyVyr/Screenshot-2026-06-19-001339.png)
---

## 🔗 Table Relationships

- `Bookings.match_id` → References `Matches.match_id` *(Foreign Key)*
- All tables are connected through proper relational constraints to ensure data integrity.

---

## 📋 Solved SQL Queries

| # | Query Topic |
|---|-------------|
| 1 | Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'. |
| 2 | Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive).|
| 3 | Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'.|
| 4 | Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams. |
| 5 | Query 5: Display a comprehensive list of all users and their booking IDs, ensuring that fans who have never bought a ticket are still listed.|
| 6 | Query 6: Find all ticket bookings where the total cost is strictly higher than the average cost of all ticket bookings. |
| 7 | Query 7: Retrieve the top 2 most expensive matches sorted by base ticket price, skipping the absolute highest premium match. |

> ✅ All queries are written and tested in **PostgreSQL**

---

## 💬 Interview Questions & Answers

### ❓ Question 1:
**What role does a Foreign Key play in the Bookings table, and how does it safeguard against entering a ticket sale for a match that doesn't exist?**

**Answer:**
A Foreign Key creates a relationship between two tables and helps maintain data accuracy.
For example, if the Match ID in the Bookings table is linked to the Match ID in the Matches table through a Foreign Key, the database checks whether the match exists.
If someone tries to book a ticket using a Match ID that is not present in the Matches table, the database will not accept that data.
So, the Foreign Key ensures that tickets can only be booked for existing matches and prevents invalid data from being entered.

---

### ❓ Question 2:
**Why are we unable to use an aggregate function like COUNT(booking_id) inside a standard WHERE clause to filter match rows? How does HAVING solve this?**

**Answer:**
The `WHERE` clause works before the data is grouped.
On the other hand, `COUNT()` is an aggregate function that calculates values after the data has been grouped.
So, we cannot use `COUNT()` inside a `WHERE` clause because the count value has not been calculated yet.
The `HAVING` clause works after grouping and after aggregate calculations are completed.
Therefore, if we want to apply conditions on the results of aggregate functions like `COUNT()`, `SUM()`, or `AVG()`, we use the `HAVING` clause.

---

### ❓ Question 3:
**What is the difference between a main query and a subquery? In what scenarios would you choose to use a subquery over a standard JOIN operation?**

**Answer:**
A Main Query is the primary query that directly returns the final result.
A Subquery is a smaller query inside the Main Query. It runs first and provides a value or information to the Main Query.
We use a Subquery when we only need a condition or a value from another table and do not need to display data from that table.
We use a JOIN when we need to combine and display data from multiple tables together.

---

## 🛠️ Tech Stack

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

---

## 👤 Author

**Siam Ahamed** <br>
Diploma in Computer Science & Technology <br>
Mymensingh Polytechnic Institute
