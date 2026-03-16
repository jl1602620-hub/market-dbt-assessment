--CORE
-- Customers & Their Locations
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE customer_address (
    address_id INT PRIMARY KEY,
    customer_id INT,
    address_line_1 VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20),
    is_default_shipping BOOLEAN DEFAULT FALSE
);

-- Sellers & Products
CREATE TABLE seller (
    seller_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    rating FLOAT,
    joined_date DATE
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    category VARCHAR(100),
    brand VARCHAR(100)
);

CREATE TABLE seller_product_price (
    seller_id INT,
    product_id INT,
    current_price DECIMAL(10, 2),
    stock_quantity INT,
    updated_at TIMESTAMP,
    PRIMARY KEY (seller_id, product_id)
);



--TRANSACTION
-- The Order Header
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    shipping_address_id INT,
    order_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    total_order_amount DECIMAL(12, 2),
    status VARCHAR(20) -- e.g., 'pending', 'shipped', 'cancelled'
);

-- Individual Items within an Order
CREATE TABLE order_line (
    order_line_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    seller_id INT,
    quantity INT,
    unit_price_at_sale DECIMAL(10, 2)-- Snapshot of price at time of purchase
);