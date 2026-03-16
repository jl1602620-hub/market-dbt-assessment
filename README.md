# Marketplace Analytics Pipeline (dbt)

## Overview

This project builds a **data transformation pipeline using dbt and
PostgreSQL** to convert a normalized **OLTP marketplace database** into
a **STAR schema optimized for analytics**.

The pipeline transforms raw operational tables into **staging models,
dimension tables, fact tables, and analytics models**.

The resulting models allow analysis of:

-   Top performing sellers
-   Best selling products
-   Customer purchasing patterns by location

------------------------------------------------------------------------

# Source OLTP Schema

The source system represents an online marketplace.

## Core Tables

### customer

  Column        Description
  ------------- -----------------------
  customer_id   Primary key
  first_name    Customer first name
  last_name     Customer last name
  email         Unique customer email
  created_at    Account creation date

### customer_address

  Column                Description
  --------------------- -------------------------
  address_id            Primary key
  customer_id           Foreign key to customer
  address_line_1        Street address
  city                  City
  state                 State
  zip_code              Zip code
  is_default_shipping   Default shipping flag

### seller

  Column        Description
  ------------- --------------------
  seller_id     Primary key
  store_name    Seller store name
  rating        Seller rating
  joined_date   Date seller joined

### product

  Column         Description
  -------------- ------------------
  product_id     Primary key
  product_name   Product name
  category       Product category
  brand          Product brand

------------------------------------------------------------------------

# STAR Schema Design

The OLTP schema is transformed into a **STAR schema** for analytics.

## Fact Table

### fact_orders

Grain: **1 row = 1 order line**

Columns:

-   order_line_id
-   order_id
-   customer_id
-   product_id
-   seller_id
-   address_id
-   order_date
-   quantity
-   unit_price_at_sale
-   line_total

------------------------------------------------------------------------

## Dimension Tables

### dim_customer

-   customer_id
-   first_name
-   last_name
-   email
-   created_at

### dim_product

-   product_id
-   product_name
-   category
-   brand

### dim_seller

-   seller_id
-   store_name
-   rating
-   joined_date

### dim_address

-   address_id
-   customer_id
-   city
-   state
-   zip_code
-   is_default_shipping

### dim_date

-   date
-   year
-   month
-   day
-   quarter

------------------------------------------------------------------------

# STAR Schema Diagram

                     dim_date
                        |
                        |
    dim_customer ---- fact_orders ---- dim_product
                        |
                        |
                    dim_seller
                        |
                        |
                    dim_address

------------------------------------------------------------------------

# dbt Project Structure

    models/
    │
    ├ staging/
    │   stg_customer.sql
    │   stg_customer_address.sql
    │   stg_orders.sql
    │   stg_order_line.sql
    │   stg_product.sql
    │   stg_seller.sql
    │
    ├ marts/
    │   ├ dimensions/
    │   │   dim_customer.sql
    │   │   dim_product.sql
    │   │   dim_seller.sql
    │   │   dim_address.sql
    │   │   dim_date.sql
    │   │
    │   └ facts/
    │       fact_orders.sql
    │
    └ analytics/
        top_sellers.sql
        top_product.sql
        top_customer_locations.sql

------------------------------------------------------------------------

# Analytics Models

### Top Sellers

Calculates total revenue per seller.

### Top Products

Ranks products by quantity sold.

### Top Customer Locations

Identifies geographic locations generating the most revenue.

------------------------------------------------------------------------

# Technologies Used

-   PostgreSQL
-   dbt
-   SQL

------------------------------------------------------------------------

# Author

Jason
