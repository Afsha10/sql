SELECT * FROM customers;

SELECT *
    FROM invoices;
SELECT sum(total)
    FROM invoices
    WHERE invoice_date BETWEEN '2023-07-01' AND '2023-07-31';

SELECT * FROM reservations;
SELECT avg(checkout_date - checkin_date) AS average_nights FROM reservations;

SELECT * FROM rooms;
SELECT min(rate) AS lowest_rate from rooms;
SELECT max(rate) AS highest_rate FROM rooms;
SELECT min(rate) AS lowest_rate, max(rate) AS highest_rat FROM rooms;

SELECT * FROM customers;
SELECT count(id) AS id_count, count(postcode) AS postcode_count FROM customers;

SELECT count(*)AS Belgians_ct FROM customers WHERE country = 'Belgium';

-- Exercise 1 #1

SELECT count(*) AS rooms_row_count FROM rooms;
SELECT count(*) AS room_types_row_count FROM room_types;
SELECT count(*) AS customers_row_count FROM customers;
SELECT count(*) AS reservations_row_count FROM reservations;

-- Exercise 1 #2

SELECT * FROM reservations;
SELECT count(checkin_date BETWEEN '2023-10-01' AND '2023-10-31' AND checkout_date BETWEEN '2023-10-01' AND '2023-10-31') FROM reservations;

-- Exercise 1 #3

SELECT * FROM invoices;
SELECT count(invoices.paid = false) AS unpaid_over_1month FROM invoices WHERE invoice_date < CURRENT_DATE - interval '1 month';
-- Testing Exercise 1 #3
SELECT sum(total), count(total), count(invoices.paid = false) AS unpaid_over_1month FROM invoices WHERE invoice_date < CURRENT_DATE - interval '1 month';


-- Exercise 1 #4
SELECT * from customers;
SELECT * from reservations;
SELECT max(checkin_date-booking_date) AS gap_betn_booking_checkin from reservations;

-- -----------------------------------

SELECT * FROM rooms;
SELECT count(*) FROM rooms GROUP By room_type;
SELECT room_type, count(*) AS room_type_count FROM rooms GROUP By room_type;

SELECT * from reservations;
SELECT trunc(room_no/100) AS floor, to_char(checkin_date, 'YYYY-MM') AS month, count(*), sum(no_guests), avg(no_guests) FROM reservations WHERE room_no BETWEEN 200 AND 399 GROUP BY floor, month;

SELECT trunc(room_no/100) AS floor, to_char(checkin_date, 'YYYY-MM') AS month, count(*), sum(no_guests), avg(no_guests) FROM reservations GROUP BY floor, month HAVING count(*) > 4;


-- Exercise 2 #1

SELECT * FROM invoices;
SELECT sum(total) AS monthly_total, to_char(invoices.invoice_date, 'YYYY-MM') AS monthly_invoice_date FROM invoices GROUP BY monthly_invoice_date;

-- Exercise 2 #2

SELECT * FROM rooms;
SELECT trunc(room_no/100) AS floor, sum(rooms.no_guests) FROM rooms GROUP BY floor ORDER BY floor;

-- Exercise 2 #3

SELECT * FROM reservations;
SELECT reservations.room_no, checkout_date-checkin_date AS less_than_10_nights FROM reservations WHERE checkout_date-checkin_date < 10 GROUP BY reservations.room_no, less_than_10_nights ORDER BY room_no;
SELECT reservations.room_no, checkout_date-checkin_date AS less_than_10_nights FROM reservations WHERE checkout_date-checkin_date < 10 GROUP BY reservations.room_no, less_than_10_nights ORDER BY room_no;

-- -----------------------------------

SELECT * FROM customers;
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith', 'j.smith@johnsmith.org', '11 New Road', 'Liverpool', 'L10 2AB', 'UK');
SELECT * FROM customers WHERE name = 'John Smith';

-- Exercise 3 #1

INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Queen Afsha', 'q.afsha@afsha.org', '9 New Castle', 'Tomatopool', 'H3 1L0', 'UK');
SELECT * FROM customers WHERE name = 'Queen Afsha';

-- Exercise 3 #2

SELECT * FROM room_types;
INSERT INTO room_types(room_type, def_rate) VALUES ('PENTHOUSE', 185.00);
SELECT * FROM room_types WHERE room_type = 'PENTHOUSE';

-- -----------------------------------
