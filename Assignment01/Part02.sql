-- Assignment 01

-- Part 02

-- Product table schema
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0) -- Making sure that entered price is not negative
);

-- Product inventory schema
CREATE TABLE inventory (
    product_id INT,
    current_quantity INT NOT NULL CHECK (current_quantity >= 0), -- Making sure that stock quantity is not negative
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE -- Makes sense to remove inventory data of a product that has been completly removed
);

-- Product sales schema
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE NOT NULL,
    units_sold INT NOT NULL CHECK (units_sold >= 0 ), -- Making sure that units sold is not negative
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price > 0), -- Making sure that total price is positive and greater than 0
    FOREIGN KEY (product_id) REFERENCES products(product_id) -- Didn't cascade delete this user might wanna keep track of how product did in sales to maybe bring it back later,
);


INSERT INTO products (product_id, product_name, category, price) VALUES
(1, 'Laptop', 'Electronics', 1000.00),
(2, 'Smartphone', 'Electronics', 800.00),
(3, 'Headphones', 'Electronics', 150.00),
(4, 'Refrigerator', 'Appliances', 500.00),
(5, 'Washing Machine', 'Appliances', 600.00);

INSERT INTO inventory (product_id, current_quantity) VALUES
(1, 8),
(2, 15),
(3, 5),
(4, 20),
(5, 7);

INSERT INTO sales (sale_id, product_id, sale_date, units_sold, total_price) VALUES
(1, 1, '2023-09-01', 2, 2000.00),
(2, 2, '2023-09-05', 5, 4000.00),
(3, 3, '2023-09-07', 3, 450.00),
(4, 4, '2023-09-09', 1, 500.00),
(5, 5, '2023-09-11', 5, 3000.00);

select * from products;
select * from sales;
select * from inventory;

select products.product_name, sum(sales.units_sold) as total_units_sold, inventory.current_quantity as available_quntity from products join sales on products.product_id = sales.product_id join inventory on products.product_id = inventory.product_id where current_quantity > 10 group by products.product_name, inventory.current_quantity having sum(sales.units_sold) > 5; 
select * from products join inventory on products.product_id = inventory.product_id where category="Electronics" and current_quantity < 10;
select products.product_name, products.category, products.price from products join sales on products.product_id = sales.product_id join inventory on inventory.product_id = products.product_id where current_quantity > 5 and units_sold > 0;



