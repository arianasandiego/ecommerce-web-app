-- SCHEMA: public

SET search_path TO public;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS order_items CASCADE;

CREATE TABLE users (
	id			SERIAL			PRIMARY KEY,
	name		VARCHAR(100)	NOT NULL,
	email		VARCHAR(100)	UNIQUE NOT NULL,
	password	TEXT			NOT NULL,
	created		TIMESTAMP		DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE categories (
	id			SERIAL			PRIMARY KEY,
	name		VARCHAR(100)	UNIQUE NOT NULL,
	description	TEXT
);

CREATE TABLE products (
	id			SERIAL			PRIMARY KEY,
	name		VARCHAR(100)	NOT NULL,
	description	TEXT,
	price		DECIMAL(10,2)	NOT NULL CHECK (price >= 0),
	stock		INTEGER			NOT NULL DEFAULT 0 CHECK (stock >= 0),
	category_id	INTEGER			NOT NULL,
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
	id			SERIAL		PRIMARY KEY,
	user_id		INTEGER		NOT NULL,
	order_date	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP,
	status		VARCHAR(50)	NOT NULL DEFAULT 'Pending' CHECK (status IN ('Pending','Completed','Cancelled')),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
	id			SERIAL			PRIMARY KEY,
	order_id	INTEGER			NOT NULL,
	product_id	INTEGER			NOT NULL,
	quantity	INTEGER			NOT NULL CHECK (quantity > 0),
	price		DECIMAL(10,2)	NOT NULL CHECK (price >= 0),
	FOREIGN KEY (order_id) REFERENCES orders(id),
	FOREIGN KEY (product_id) REFERENCES products(id)
);