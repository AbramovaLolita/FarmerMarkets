locations (ID, city,county,state) — ни от кого не зависит
products (ID, name) — справочник 
payment_methods (ID, name) — справочник
markets (FMID,  street, lat,long, location_id, UpdateTime) — основная таблица (зависит от locations)
market_media (FMID, Website,Facebook,Twitter,Youtube,OtherMedia) — зависит от markets
market_products (FMID, ProductID) — связка  markets и products
market_payments (FMID, PaymentID) — связка от markets и payment_methods
market_schedules (FMID, Season, Date, Time) — зависит от markets



CREATE DATABASE farmers_markets;

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city text ,
    county text ,
    state text,
    zip text
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT UNIQUE
);

CREATE TABLE markets (
    fmid INT PRIMARY KEY, 
    name TEXT NOT NULL,
	street TEXT,
    lat numeric,
    long numeric,	
	update_time TEXT
    location_id INT REFERENCES locations(location_id),
);

CREATE TABLE market_media (
    market_fmid INT PRIMARY KEY, 
    website TEXT,
    facebook TEXT,
    twitter TEXT,
    youtube TEXT,
    other_media TEXT,
    CONSTRAINT fk_media_market 
        FOREIGN KEY (market_fmid) 
        REFERENCES markets (fmid)
        ON DELETE CASCADE 
);

CREATE TABLE payment_methods (
    payment_id INT PRIMARY KEY,
    payment_name TEXT UNIQUE
);

CREATE TABLE market_products (
    market_fmid INT REFERENCES markets(fmid) ON DELETE CASCADE,
    product_id INT REFERENCES products (product_id) ON DELETE CASCADE,

    PRIMARY KEY (market_fmid, product_id)
);

CREATE TABLE market_payments (
    market_fmid INT REFERENCES markets(fmid) ON DELETE CASCADE,
    payment_method_id INT REFERENCES payment_methods(payment_method_id) ON DELETE CASCADE,

    PRIMARY KEY (market_fmid, payment_method_id)
);

CREATE TABLE market_schedules (
    schedule_id SERIAL PRIMARY KEY,
    season_number INT, 
    season_date TEXT,
    season_time TEXT,
	market_fmid INT REFERENCES markets(fmid)
);



\COPY table_name
FROM '/path/table_name.csv' 
DELIMITER ','
CSV HEADER;