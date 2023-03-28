CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(50),
	phone VARCHAR(50)
);

SELECT *
FROM customer;

CREATE TABLE dealership(
	dealer_id SERIAL PRIMARY KEY,
	name_ VARCHAR(50) NOT NULL,
	address VARCHAR(50),
	email VARCHAR(50),
	phone VARCHAR(50)
);

SELECT *
FROM dealership;

CREATE TABLE cars(
	car_id SERIAL PRIMARY KEY,
	vin_number VARCHAR(50) NOT NULL,
	price NUMERIC(7,2),
	dealer_id Integer NOT NULL,
	FOREIGN KEY(dealer_id) REFERENCES dealership(dealer_id)
);

SELECT *
FROM cars;

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	number_ VARCHAR(50) NOT NULL,
	date_ TIMESTAMP NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES cars(car_id)
);

SELECT *
FROM invoice;

ALTER TABLE invoice
ADD COLUMN customer_id INTEGER NOT NULL;

ALTER TABLE invoice
ADD FOREIGN KEY(customer_id) REFERENCES customer(customer_id);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	invoice_id INTEGER NOT NULL,
	FOREIGN KEY(invoice_id) REFERENCES invoice(invoice_id)
);

SELECT *
FROM salesperson;

ALTER TABLE cars
ADD COLUMN salesperson_id INTEGER NOT NULL;

ALTER TABLE cars
ADD FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id);

SELECT *
FROM cars;

ALTER TABLE cars
DROP COLUMN salesperson_id;

CREATE TABLE service_vehicle(
	service_id SERIAL PRIMARY KEY,
	vin_number VARCHAR(50) NOT NULL
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	ticket_number VARCHAR(50) NOT NULL,
	maintenance_date TIMESTAMP NOT NULL,
	maintenance_type VARCHAR(50) NOT NULL,
	price NUMERIC(5,2) NOT NULL,
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	service_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service_vehicle(service_id)
);

SELECT *
FROM service_ticket;

ALTER TABLE service_vehicle
ADD COLUMN ticket_id INTEGER NOT NULL;

ALTER TABLE service_vehicle
ADD FOREIGN KEY(ticket_id) REFERENCES service_ticket(ticket_id);
