-- =====================================================================
-- Railway Network & Timetable
-- 04_app_account.sql  (optional, recommended)
--
-- Creates a MySQL account for the desktop application that may ONLY
-- execute the routines of 03_business_routines.sql. It cannot read or
-- change any table directly, which guarantees that every business rule
-- in the routines is always applied.
--
-- 1. Replace CHANGE_ME_PASSWORD below with a password of your choice.
-- 2. Run this file as root after 01, 02 and 03.
-- 3. Put the same user/password into config/connection.properties.
-- =====================================================================

CREATE USER IF NOT EXISTS 'railway_app'@'localhost' IDENTIFIED BY 'CHANGE_ME_PASSWORD';
GRANT EXECUTE ON RailwayManagement.* TO 'railway_app'@'localhost';
FLUSH PRIVILEGES;
