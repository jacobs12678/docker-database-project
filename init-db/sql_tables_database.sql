-- Creating Group A's database
CREATE DATABASE projectdb;
/*
Tables are created in the order shown below along with the inserted values.
*/
/*----------------------------------------------------------------------------------------------*/

/* Submit & Log Items */
CREATE TABLE submitlog (
sl_id int,
item_name varchar(100),
location varchar(100),
item_type varchar(100),
item_desc varchar(200),
registered_item TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT submitlog_PK PRIMARY KEY (sl_id));

-- INSERT VALUES for submitlog table
INSERT INTO submitlog (sl_id, item_name, location, item_type, item_desc) VALUES
(1, 'credit card', 'Commons', 'Identification', 'Light blue card with name and number');
INSERT INTO submitlog (sl_id, item_name, location, item_type, item_desc) VALUES
(2, 'social security card', 'Commons', 'Visa credit card with bank logo', 'Used for conducting digital transactions.');
INSERT INTO submitlog (sl_id, item_name, location, item_type, item_desc) VALUES
(3, 'house keys', 'Commons', 'Keys with a green keychain', 'Access to entering a home.');
/*----------------------------------------------------------------------------------------------*/

/* Subscription Table */
CREATE TABLE subscription (
sub_id int, 
service varchar(300),
cost int,
payment_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT sub_PK PRIMARY KEY (sub_id));

-- INSERT VALUES for subscription table
INSERT INTO subscription (sub_id, service, cost) VALUES
(1, '3 Months Subscription Plan', 30);
INSERT INTO subscription (sub_id, service, cost) VALUES
(2, '6 Months Subscription Plan', 60);
INSERT INTO subscription (sub_id, service, cost) VALUES
(3, '1 Year Subscription Plan', 90);
/*----------------------------------------------------------------------------------------------*/

/* Ticket Table */
CREATE TABLE ticket (
t_id int, 
confirmation varchar(50),
type varchar(50),
submitted timestamp,
CONSTRAINT t_PK PRIMARY KEY (t_id));

-- INSERT VALUES for ticket table
INSERT INTO ticket (t_id, confirmation, type, submitted) VALUES
(1, 'Confirmed', 'Service Request', '2025-12-01 10:15:00');
INSERT INTO ticket (t_id, confirmation, type, submitted) VALUES
(2, 'Pending', 'Billing and Payment', '2025-12-01 11:34:25');
INSERT INTO ticket (t_id, confirmation, type, submitted) VALUES
(3, 'Cancelled', 'Technical Support', '2025-12-01 09:45:36');
/*----------------------------------------------------------------------------------------------*/

/* Login & Signup Table */
CREATE TABLE loginsign (
ls_id int,
ls_t_id int,
ls_sub_id int,
user_name varchar(50),
username varchar(50),
password varchar(100),
email varchar(100),
registered_item TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT loginsign_PK PRIMARY KEY (ls_id),
CONSTRAINT t_FK FOREIGN KEY (ls_t_id) REFERENCES ticket (t_id),
CONSTRAINT sub_FK FOREIGN KEY (ls_sub_id) REFERENCES subscription (sub_id));

-- INSERT VALUES for loginsign table
INSERT INTO loginsign (ls_id, ls_t_id, ls_sub_id, user_name, username, password, email) VALUES
(1, 1, 3, 'Derp', 'derp123', 'sushiwushi11', 'derp25@umbc.edu');
INSERT INTO loginsign (ls_id, ls_t_id, ls_sub_id, user_name, username, password, email) VALUES
(2, 3, 2, 'Sophie', 'sophie456', 'pollens36', 'sophie21@umbc.edu');
INSERT INTO loginsign (ls_id, ls_t_id, ls_sub_id, user_name, username, password, email) VALUES
(3, 2, 1, 'Link', 'link789', 'triforce3', 'link33@umbc.edu');
/*----------------------------------------------------------------------------------------------*/

/* Search Function/Display General Item(s) */
CREATE TABLE searchdisplay (
sd_id int,
sl_id_FK int,
ls_id_FK int,
keyword varchar(100),
CONSTRAINT searchdisplay_PK PRIMARY KEY (sd_id),
CONSTRAINT loginsign_FK FOREIGN KEY (ls_id_FK) REFERENCES loginsign (ls_id),
CONSTRAINT submitlog_FK FOREIGN KEY (sl_id_FK) REFERENCES submitlog (sl_id));

-- INSERT VALUES for searchdisplay table
INSERT INTO searchdisplay (sd_id, sl_id_FK, ls_id_FK, keyword) VALUES
(1, 2, 1, 'credit card');
INSERT INTO searchdisplay (sd_id, sl_id_FK, ls_id_FK, keyword) VALUES
(2, 1, 3, 'social security card');
INSERT INTO searchdisplay (sd_id, sl_id_FK, ls_id_FK, keyword) VALUES
(3, 3, 2, 'house keys');
/*----------------------------------------------------------------------------------------------*/

