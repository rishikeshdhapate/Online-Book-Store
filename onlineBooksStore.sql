 
USE  onlineBooksStore;


create table books (
	book_id serial primary key,
    title varchar(100),
    author varchar(100),
    genre varchar(50),
    publised_year int,
    price numeric(10, 2),
    stock int
);
create table customers (
	customer_id serial primary key,
    name varchar(100),
    email varchar(100),
    phone varchar(15),
    city varchar(50),
    country varchar(150)
     
);
select* from books;
CREATE TABLE orders(
	order_id serial primary key,
    customer_id int references customers(customer_id),
    book_id int references books(book_id),
    order_date date,
    quantity int,
    total_price numeric(10,2)
);
select* from customers;
select* from orders;
drop table orders;
CREATE TABLE  if not exists orders(
	order_id serial primary key,
    customer_id int ,
    foreign key (customer_id) references customers(customer_id),
    book_id int,
    foreign key (book_id) references books(book_id),
    order_date date,
    quantity int,
    total_price numeric(10,2)
);
CREATE TABLE  if not exists orders(
	order_id serial primary key,
    customer_id int ,
    foreign key (customer_id) references customers(customer_id),
    book_id int,
    foreign key (book_id) references books(book_id),
    order_date date,
    quantity int,
    total_price numeric(10,2)
);
CREATE TABLE  if not exists orders(
	order_id serial primary key,
    customer_id serial,
    foreign key (customer_id) references customers(customer_id),
    book_id serial,
    foreign key (book_id) references books(book_id),
    order_date date,
    quantity int,
    total_price numeric(10,2)
);
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_price NUMERIC(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_price NUMERIC(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
drop table books;
drop table customers;
create table books (
	book_id int AUTO_INCREMENT primary key,
    title varchar(100),
    author varchar(100),
    genre varchar(50),
    publised_year int,
    price numeric(10, 2),
    stock int
);
create table customers (
	customer_id int AUTO_INCREMENT primary key,
    name varchar(100),
    email varchar(100),
    phone varchar(15),
    city varchar(50),
    country varchar(150)
     
);
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_price NUMERIC(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
 
select* from orders;
select* from customers;
select* from books;
-- retrive all books in the FIction genre
SELECT * FROM books 
where genre='Fiction';
-- retrive all books published after 1950
 SELECT * FROM BOOKS
WHERE published_year >= 1950
ORDER BY PUBLISHED_YEAR;
-- rename the column 
ALTER TABLE books
RENAME COLUMN publised_year to published_year;
 
-- list all the customer from  canada
SELECT * FROM customers 
where country = 'Canada';

-- show order placed on november 2023
SELECT * FROM orders
where order_date between '2023-11-1' and '2023-11-30';
-- retrive total stock of books available
select sum(stock) from books;

-- calculated total revenue generated from all orders
SELECT SUM(total_price) as revenue FROM orders;
 
 
SELECT a.genre ,b.quantity FROM 
books a
inner join 
orders b
on a.book_id = b.book_id
group by a.genre;
 
 
-- show the total quantity ordered for each genre
SELECT a.genre, SUM(b.quantity) AS total_quantity
FROM books a
JOIN orders b ON a.book_id = b.book_id
GROUP BY a.genre;
SELECT genre,avg(price)
from books
where genre ='Fantasy'
group by genre;
 
select* from orders;
select* from customers;
 
select* from customers;
-- list coustomer name and quantity they ordered
SELECT a.name,b.quantity 
FROM customers a
JOIN orders b
ON a.customer_id = b.customer_id;
-- list customer name those who have order more than 2 books
SELECT a.name,b.quantity 
FROM customers a
JOIN orders b
ON a.customer_id = b.customer_id
WHERE quantity>=2;
-- Count  customer having same name
select count(name) ,name from customers
group by name;
-- List the customer who have ordered moret han two times
SELECT a.name,b.customer_id,count(b.order_id) as toal_order
FROM customers a
JOIN orders b
ON a.customer_id = b.customer_id
group by customer_id
HAVING COUNT(order_id)>=2;

show tables;