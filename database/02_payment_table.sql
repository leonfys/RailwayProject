-- =====================================================================
-- Railway Network & Timetable
-- 02_payment_table.sql
--
-- Adds the Payment relation that appears in the ERD, the relational
-- schema and Normalization.docx but is missing from SQL.sql.
-- 01_schema_and_seed.sql is NOT modified; run this file right after it.
--
-- Relational schema (from the ERD):
--   Payment(Pay_ID, Pay_Date, Method, Booking_ID)   Booking_ID: FK, UNIQUE
--   -> one booking has at most one payment (1:1, total on Payment side)
-- =====================================================================
USE RailwayManagement;

DROP TABLE IF EXISTS Payment;

CREATE TABLE Payment (
    Pay_ID      VARCHAR(10) PRIMARY KEY,
    Pay_Date    DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Method      VARCHAR(30) NOT NULL,
    Booking_ID  VARCHAR(10) NOT NULL,
    FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
        ON DELETE NO ACTION
        ON UPDATE CASCADE,
    CONSTRAINT uq_payment_booking UNIQUE (Booking_ID),
    CONSTRAINT chk_payment_method CHECK (Method IN ('Cash', 'Card', 'Bank Transfer', 'E-Wallet'))
);
