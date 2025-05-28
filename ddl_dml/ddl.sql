-- Active: 1748192019204@@127.0.0.1@5432@lab2
DROP TABLE IF EXISTS fact_sales;
DROP TABLE IF EXISTS dim_customer_pet;
DROP TABLE IF EXISTS dim_customer;
DROP TABLE IF EXISTS dim_seller;
DROP TABLE IF EXISTS dim_product;
DROP TABLE IF EXISTS dim_supplier;
DROP TABLE IF EXISTS dim_store;


-- Таблица клиентов
CREATE TABLE dim_customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50)
);

-- Таблица питомцев
CREATE TABLE dim_customer_pet (
    pet_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customer(customer_id),
    name VARCHAR(50),
    type VARCHAR(50),
    breed VARCHAR(50),
    category VARCHAR(50)
)

-- Таблица продавцов
CREATE TABLE dim_seller (
    seller_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    country VARCHAR(50),
    postal_code VARCHAR(50)
);

-- Таблица товаров
CREATE TABLE dim_product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    category VARCHAR(50),
    price FLOAT,
    quantity INT,
    weight FLOAT,
    color VARCHAR(50),
    size VARCHAR(50),
    brand VARCHAR(50),
    material VARCHAR(50),
    description VARCHAR(1024),
    rating FLOAT,
    reviews INT,
    release_date DATE,
    expiry_date DATE
);

-- Таблица поставщиков
CREATE TABLE dim_supplier (
    supplier_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    contact VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Таблица магазинов
CREATE TABLE dim_store (
    store_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(50),
    email VARCHAR(50)
);

-- Основная таблица продаж
CREATE TABLE fact_sales (
    sale_id INT,
    customer_id INT REFERENCES dim_customer(customer_id),
    seller_id INT REFERENCES dim_seller(seller_id),
    product_id INT REFERENCES dim_product(product_id),
    supplier_id INT REFERENCES dim_supplier(supplier_id),
    store_id INT REFERENCES dim_store(store_id),
    date DATE,
    quantity INT,
    total_price FLOAT
);
