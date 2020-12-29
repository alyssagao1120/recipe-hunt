
DROP TABLE IF EXISTS RECIPES;
DROP TABLE IF EXISTS INGREDIENTS;
DROP TABLE IF EXISTS RECIPE_TO_INGREDIENTS;
DROP TABLE IF EXISTS RECIPE_TO_REVIEWS;
DROP TABLE IF EXISTS REVIEWS;
DROP TABLE IF EXISTS MODERATORS;
DROP TABLE IF EXISTS SUBSCRIBERS;

CREATE TABLE INGREDIENTS (
	ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    NAME VARCHAR(50)
);

CREATE TABLE RECIPES (
	ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    LINK VARCHAR(50) NOT NULL,
    VERIFIED_BY_MODERATOR CHAR(1) NOT NULL,
    MEAL VARCHAR(50) NOT NULL,
    TYPE VARCHAR(50) NOT NULL
);

CREATE TABLE REVIEWS (
	ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    REVIEWER_NAME VARCHAR(50) NOT NULL,
    REVIEW VARCHAR(750) NOT NULL,
    REVIEW_DATE DATE NOT NULL,
    VERIFIED_BY_MODERATOR CHAR(1) NOT NULL,
    RECIPE_ID INT NOT NULL,
    FOREIGN KEY (RECIPE_ID) REFERENCES RECIPES(ID)
);

CREATE TABLE RECIPE_TO_INGREDIENTS (
	RECIPE_ID INT NOT NULL,
    INGREDIENT_ID INT NOT NULL,
    FOREIGN KEY (RECIPE_ID) REFERENCES RECIPES(ID),
    FOREIGN KEY (INGREDIENT_ID) REFERENCES INGREDIENTS(ID)
);

CREATE TABLE RECIPE_TO_REVIEWS (
	RECIPE_ID INT NOT NULL,
    REVIEW_ID INT NOT NULL,
    FOREIGN KEY (RECIPE_ID) REFERENCES RECIPES(ID),
    FOREIGN KEY (REVIEW_ID) REFERENCES REVIEWS(ID)
);

CREATE TABLE MODERATORS (
	ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	USERNAME VARCHAR(50) NOT NULL, 
    PASSWORD VARCHAR(100) NOT NULL,
    NAME VARCHAR(50) NOT NULL
);

CREATE TABLE SUBSCRIBERS (
	ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
	EMAIL VARCHAR(50) NOT NULL, 
    PASSWORD VARCHAR(100) NOT NULL,
    NAME VARCHAR(50) NOT NULL
);














DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE CUSTOMERS (
	FIRST_NAME VARCHAR(100) NOT NULL, 
    LAST_NAME VARCHAR(100) NOT NULL, 
    EMAIL VARCHAR(100) NOT NULL, 
    PASS_WORD VARCHAR(100) NOT NULL,
    ADDRESS VARCHAR(100) NOT NULL,
    AGE INT NOT NULL,
    SKIN_TYPE VARCHAR(100) NOT NULL,
    SKIN_CONCERN VARCHAR(100) NOT NULL,
    ACTIVATED CHAR(1) NOT NULL,
    PRIMARY KEY (EMAIL)
);

DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE PRODUCTS (
	ID INT AUTO_INCREMENT NOT NULL,
    NAME VARCHAR(300) NOT NULL, 
    BRAND VARCHAR(100) NOT NULL, 
	DESCRIPTION VARCHAR(500) NOT NULL, 
    PRICE DECIMAL (5,2) NOT NULL, 
    IN_STOCK INT NOT NULL, 
    PRIMARY KEY(ID)
);

INSERT INTO PRODUCTS(NAME, BRAND, DESCRIPTION, PRICE, IN_STOCK) VALUES
('Low Ph Good Morning Gel Cleanser', 'COSRX', 'Discover day-long moisture with the COSRX Low pH Good Morning Cleanser; a daily face wash that is gentle enough for sensitive skin types.Boasting a mildly acidic pH, the cleansing formula is similar to skin’s natural pH level. The effective gel formula works to remove waste produced by skin during sleep, leaving the complexion clean and clear. A healthy dose of Tea Tree Oil is ideal for those with oily skin types.', 14.99, 10),
('Green Tea Seed Serum', 'innisfree', 'Antioxidant-rich serum contains a reviving and hydrating mix of organic green tea water, panthenol, batain and green complex that helps restore skin clarity and suppleness. The active ingredient of green tea seed locks moisture right next to skin''s surface, while panthenol and batain boost skin''s natural ability to produce moisture. To use, pat on serum on cleansed face and neck. Follow with moisturizer.', 29.93, 20),
('Glycolic Acid 7% Toning Solution', 'THE ORDINARY', 'An exfoliating toning solution with seven percent glycolic acid, amino acids, aloe vera, ginseng, and tasmanian pepperberry.', 8.70, 50);

DROP TABLE IF EXISTS MANAGERS;
CREATE TABLE MANAGERS (
	FIRST_NAME VARCHAR(100) NOT NULL, 
    LAST_NAME VARCHAR(100) NOT NULL, 
	USERNAME VARCHAR(100) NOT NULL,
    PASS_WORD VARCHAR(100) NOT NULL,
    HAS_ACCESS CHAR(1) NOT NULL,
    PRIMARY KEY(USERNAME)
);

INSERT INTO MANAGERS VALUES
('John', 'Smith', 'manager', 'password', 'Y');

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS (
	ID INT AUTO_INCREMENT NOT NULL,
	CUSTOMER_EMAIL VARCHAR(100) NOT NULL, 
    ORDER_STATUS VARCHAR(100) NOT NULL, 
	TOTAL DECIMAL(5,2) NOT NULL,
    PRIMARY KEY(ID),
	FOREIGN KEY (CUSTOMER_EMAIL) REFERENCES CUSTOMERS(EMAIL)
);

DROP TABLE IF EXISTS ORDER_ITEMS;
CREATE TABLE ORDER_ITEMS (
	ORDER_ID INT NOT NULL,
	PRODUCT_ID INT NOT NULL, 
    QUANTITY INT NOT NULL, 
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
);

INSERT INTO ORDERS (CUSTOMER_EMAIL, ORDER_STATUS, TOTAL) VALUES ('alyssa.gao@yahoo.ca', 'Processing', 18.00);
DELETE FROM CUSTOMERS WHERE EMAIL = 'jsmith@gmail.com';

DROP TABLE IF EXISTS ORDER_ITEMS;
DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS MANAGERS;
DROP TABLE IF EXISTS PRODUCTS;
DROP TABLE IF EXISTS CUSTOMERS;


SELECT * FROM PRODUCTS;
SELECT * FROM MANAGERS;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_ITEMS;

CREATE TABLE COURSE (
 ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 NAME VARCHAR(32) NOT NULL,
 DURATION INT DEFAULT 0,
 ACTIVE CHAR(1) DEFAULT 'A'
);
SELECT * FROM COURSE;

DELETE FROM COURSE WHERE ID = 11;

DROP TABLE IF EXISTS COURSE;

INSERT INTO COURSE (NAME) VALUES
( 'CS135-J' ),
( 'CS136-J' ),
( 'CS246-J' ),
( 'Java-J' ),
( 'TypeScript-J' ),
( 'Spring Framework-J' ),
( 'React.js-J' ),
( 'Node.js-J' ),
( 'Database-J' ),
( 'Doker-J' );

