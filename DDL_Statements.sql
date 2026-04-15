CREATE TABLE dim_date (
    date_key        NUMBER(8) PRIMARY KEY, -- YYYYMMDD
    full_date       DATE NOT NULL,
    day_number      NUMBER(2),
    month_number    NUMBER(2),
    month_name      VARCHAR2(20),
    quarter_number  NUMBER(1),
    year_number     NUMBER(4),
    season          VARCHAR2(20),
    is_holiday      NUMBER(1),
    is_promotional  NUMBER(1),
    promotional_event VARCHAR2(100)
);

CREATE TABLE dim_product (
    product_key      NUMBER(10) PRIMARY KEY,
    product_code     VARCHAR2(50) NOT NULL,
    product_name     VARCHAR2(200),
    brand_category   VARCHAR2(100),
    supplier_id      NUMBER(10),
    unit_cost        NUMBER(10,2),
    inventory_status VARCHAR2(50),
    effective_date   DATE NOT NULL,
    expiry_date      DATE NOT NULL,
    is_current       NUMBER(1) NOT NULL
);

CREATE SEQUENCE seq_dim_product START WITH 1 INCREMENT BY 1;

CREATE TABLE dim_customer (
    customer_key   NUMBER(10) PRIMARY KEY,
    customer_id    VARCHAR2(50),
    first_name     VARCHAR2(100),
    last_name      VARCHAR2(100),
    email          VARCHAR2(200),
    phone          VARCHAR2(50),
    loyalty_points NUMBER(10),
    effective_date DATE NOT NULL,
    expiry_date    DATE NOT NULL,
    is_current     NUMBER(1) NOT NULL
);

CREATE SEQUENCE seq_dim_customer START WITH 1 INCREMENT BY 1;

CREATE TABLE dim_store (
    store_key          NUMBER(10) PRIMARY KEY,
    store_id           VARCHAR2(50),
    store_branch_name  VARCHAR2(200),
    city_town_village  VARCHAR2(100),
    district           VARCHAR2(100),
    address            VARCHAR2(300),
    store_type         VARCHAR2(50),
    store_manager      VARCHAR2(200),
    effective_date     DATE NOT NULL,
    expiry_date        DATE NOT NULL,
    is_current         NUMBER(1) NOT NULL
);

CREATE SEQUENCE seq_dim_store START WITH 1 INCREMENT BY 1;

CREATE TABLE dim_salesperson (
    salesperson_key   NUMBER(10) PRIMARY KEY,
    salesperson_id    VARCHAR2(50),
    employee_id       VARCHAR2(50),
    department_id     VARCHAR2(50),
    salary            NUMBER(12,2),
    employment_status VARCHAR2(50),
    effective_date    DATE NOT NULL,
    expiry_date       DATE NOT NULL,
    is_current        NUMBER(1) NOT NULL
);

CREATE SEQUENCE seq_dim_salesperson START WITH 1 INCREMENT BY 1;

CREATE TABLE fact_sales (
    sales_fact_key     NUMBER(19) PRIMARY KEY,

    date_key           NUMBER(8) NOT NULL,
    product_key        NUMBER(10) NOT NULL,
    customer_key       NUMBER(10) NOT NULL,
    store_key          NUMBER(10) NOT NULL,
    salesperson_key    NUMBER(10) NOT NULL,

    transaction_number VARCHAR2(50),

    quantity_sold      NUMBER(10),
    sales_amount       NUMBER(12,2),
    discount_amount    NUMBER(12,2),
    tax_amount         NUMBER(12,2),
    net_sales_amount   NUMBER(12,2),
    gross_profit       NUMBER(12,2),

    CONSTRAINT fk_fs_date FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    CONSTRAINT fk_fs_product FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    CONSTRAINT fk_fs_customer FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    CONSTRAINT fk_fs_store FOREIGN KEY (store_key) REFERENCES dim_store(store_key),
    CONSTRAINT fk_fs_salesperson FOREIGN KEY (salesperson_key) REFERENCES dim_salesperson(salesperson_key)
);

CREATE SEQUENCE seq_fact_sales START WITH 1 INCREMENT BY 1;