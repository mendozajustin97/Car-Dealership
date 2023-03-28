SELECT *
FROM cars;

CREATE OR REPLACE PROCEDURE add_cars(
	vin_number VARCHAR(50),
	price NUMERIC(7,2)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO cars(vin_number, price)
	VALUES(vin_number, price);
END;
$$;

CALL add_cars('1', 40000.00);

CALL add_cars('2', 20000.00);

INSERT INTO customer(
	first_name,
	last_name,
	email,
	phone
) VALUES (
	'Justin',
	'Mendoza',
	'Mendoza@coding-temple.com',
	(208)-555-5555
);

INSERT INTO customer(
	first_name,
	last_name,
	email,
	phone
) VALUES (
	'Jonh',
	'Doe',
	'John@coding-temple.com',
	(208)-111-1234
);

SELECT *
FROM customer;



INSERT INTO dealership(
	name_,
	address,
	email,
	phone
) VALUES (
	'Mendoza Best Deals',
	'123 Goofy Street',
	'bestdeals@bestdeals.com',
	(208)-321-4321
);

SELECT *
FROM dealership;



INSERT INTO invoice(
	number_,
	date_,
	car_id
) VALUES (
	'101',
	NOW(),
	'1'
);


INSERT INTO invoice(
	number_,
	date_,
	car_id
) VALUES (
	'102',
	'10/23/2022',
	'2'
);

SELECT *
FROM invoice;



INSERT INTO mechanic(
	first_name,
	last_name
) VALUES (
	'Kenny',
	'Pickett'
);

INSERT INTO mechanic(
	first_name,
	last_name
) VALUES (
	'Najee',
	'Harris'
);

SELECT *
FROM mechanic;


INSERT INTO salesperson(
	first_name,
	last_name,
	invoice_id
) VALUES (
	'Junior',
	'Doe',
	'1'
);

INSERT INTO salesperson(
	first_name,
	last_name,
	invoice_id
) VALUES (
	'Akili',
	'Doe',
	'2'
);