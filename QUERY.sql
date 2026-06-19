-- Database Create 
CREATE DATABASE Football_Ticket_Booking_System


DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;


  
-- Table Creation

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    role VARCHAR(50) CHECK(role IN ('Football Fan','Ticket Manager')) DEFAULT 'Football Fan' ,
    phone_number VARCHAR(20) 
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    fixture VARCHAR(200) NOT NULL,
    tournament_category VARCHAR(200) NOT NULL ,
    base_ticket_price DECIMAL(10, 2) CHECK (base_ticket_price >= 0) NOT NULL,
    match_status VARCHAR(100) CHECK(match_status IN('Available', 'Selling Fast', 'Sold Out', 'Postponed')) 
);

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES Users (user_id),
    match_id INT REFERENCES Matches (match_id),
    seat_number VARCHAR(30) ,
    payment_status VARCHAR(50) CHECK(payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost DECIMAL(10,2) CHECK(total_cost > 0) NOT NULL
);



-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO Users (full_name, email, role, phone_number) VALUES
('Ayesha Siddiqua', 'ayesha@mail.com', 'Football Fan', '+8801822222222'),
('Imran Khan', 'imran@mail.com', 'Ticket Manager', '+8801833333333'),
('Tasnim Rahman', 'tasnim@mail.com', 'Football Fan', NULL),
('Tanvir Ahmed', 'tanvir.ahmed@mail.com', 'Football Fan', '+8801811111111'),
('Kazi Arif', 'arif@mail.com', 'Football Fan', '+8801844444444'),
('Tanvir Chowdhury', 'tanvir.chowdhury@mail.com', 'Ticket Manager', '+8801833333333'),
('Zubayer Ahmed', 'zubayer@mail.com', 'Ticket Manager', '+8801866666666'),
('Samiul Haque Nabil', 'samiul.haque@mail.com', 'Football Fan', '+8801844444444'),
('Nabila Islam', 'nabila@mail.com', 'Football Fan', '+8801877777777'),
('Tamim Iqbal', 'tamim@mail.com', 'Football Fan', NULL),
('Anamul Haque', 'anamul.haque@mail.com', 'Football Fan', NULL),
('Sultana Razia', 'razia@mail.com', 'Football Fan', '+8801888888888');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO Matches (fixture, tournament_category, base_ticket_price, match_status) VALUES
('Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
('Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
('Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
('AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
('Juventus vs Roma', 'Serie A', 80.00, 'Available'),
('Arsenal vs Chelsea', 'Premier League', 110.00, 'Available'),
('Dortmund vs Leverkusen', 'Bundesliga', 75.00, 'Selling Fast'),
('Atletico Madrid vs Villarreal', 'La Liga', 85.00, 'Available'),
('Inter Miami vs Al Nassr', 'Club Friendly', 200.00, 'Sold Out'),
('Napoli vs Lazio', 'Serie A', 70.00, 'Postponed');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO Bookings (user_id, match_id, seat_number, payment_status, total_cost) VALUES
(1, 1, 'A-12', 'Confirmed', 150.00),
(1, 2, 'B-04', 'Confirmed', 120.00),
(2, 1, 'A-13', 'Confirmed', 150.00),
(2, 1, NULL, NULL, 150.00),
(3, 2, 'C-20', 'Pending', 120.00),
(4, 3, 'D-05', 'Confirmed', 130.00),
(5, 2, 'B-10', 'Refunded', 120.00),
(6, 5, 'E-01', 'Cancelled', 80.00),
(7, 6, NULL, 'Pending', 110.00),
(1, 7, 'F-15', 'Confirmed', 75.00);

-- select * from users;
-- select * from matches;
-- select * from bookings;