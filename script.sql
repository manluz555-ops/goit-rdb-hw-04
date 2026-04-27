CREATE DATABASE LibraryManagement;

USE LibraryManagement;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(255) NOT NULL
);

CREATE TABLE genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year YEAR,
    author_id INT,
    genre_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

CREATE TABLE borrowed_books (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    user_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO authors (author_name) VALUES ('Тарас Шевченко'), ('Ліна Костенко');
INSERT INTO genres (genre_name) VALUES ('Поезія'), ('Роман');
ALTER TABLE books MODIFY publication_year INT;
INSERT INTO books (title, publication_year, author_id, genre_id)
VALUES ('Кобзар', 1840, 1, 1),
       ('Маруся Чурай', 1979, 2, 2);

INSERT INTO users (username, email)
VALUES ('ivan_petrenko', 'ivan@example.com'),
       ('olena_koval', 'olena@example.com');

INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date)
VALUES (1, 1, '2026-04-01', '2026-04-15'),
       (2, 2, '2026-04-10', NULL);
USE mydb;
SHOW COLUMNS FROM suppliers;
SHOW COLUMNS FROM shippers;
SHOW COLUMNS FROM categories;
SELECT *
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id
LIMIT 0, 1000;
SELECT COUNT(*) AS total_rows
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN customers c ON o.customer_id = c.id
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
INNER JOIN employees e ON o.employee_id = e.employee_id
INNER JOIN shippers sh ON o.shipper_id = sh.id
INNER JOIN suppliers sup ON p.supplier_id = sup.id;
SELECT COUNT(*) AS total_rows
FROM order_details od
LEFT JOIN orders o ON od.order_id = o.id
LEFT JOIN customers c ON o.customer_id = c.id
LEFT JOIN products p ON od.product_id = p.id
LEFT JOIN categories cat ON p.category_id = cat.id
LEFT JOIN employees e ON o.employee_id = e.employee_id
LEFT JOIN shippers sh ON o.shipper_id = sh.id
LEFT JOIN suppliers sup ON p.supplier_id = sup.id;

SELECT *
FROM order_details od
INNER JOIN orders o ON od.order_id = o.id
INNER JOIN employees e ON o.employee_id = e.employee_id
WHERE e.employee_id > 3 AND e.employee_id <= 10;
DESCRIBE categories;

SELECT cat.name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name;
SELECT cat.name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21;

SELECT cat.name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
ORDER BY row_count DESC;

SELECT cat.name,
       COUNT(*) AS row_count,
       AVG(od.quantity) AS avg_quantity
FROM order_details od
INNER JOIN products p ON od.product_id = p.id
INNER JOIN categories cat ON p.category_id = cat.id
GROUP BY cat.name
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;







