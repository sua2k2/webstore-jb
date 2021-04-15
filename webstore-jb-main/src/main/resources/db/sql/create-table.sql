DROP TABLE IF EXISTS PRODUCTS;
CREATE TABLE PRODUCTS (
	ID VARCHAR(25) PRIMARY KEY,
	NAME VARCHAR(50),
	DESCRIPTION VARCHAR(250),
	UNIT_PRICE DECIMAL,
	MANUFACTURER VARCHAR(50),
	CATEGORY VARCHAR(50),
	CONDITION VARCHAR(50),
	UNITS_IN_STOCK BIGINT,
	UNITS_IN_ORDER BIGINT,
	DISCONTINUED BOOLEAN
);

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	ID VARCHAR(25) PRIMARY KEY,
	NAME VARCHAR(50),
	address  VARCHAR(250),
	noOfOrdersMade INT
);

DROP TABLE IF EXISTS CART ;
CREATE TABLE CART (
ID VARCHAR(50) PRIMARY KEY
);

DROP TABLE IF EXISTS CART_ITEM;
CREATE TABLE CART_ITEM (
ID VARCHAR(75),PRODUCT_ID VARCHAR(25),
CART_ID varchar(50),
QUANTITY BIGINT,
CONSTRAINT CART_ITEM_PK PRIMARY KEY (ID,CART_ID),
CONSTRAINT product_FK FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS(ID),
CONSTRAINT cart_FK FOREIGN KEY (CART_ID) REFERENCES CART(ID)
);

DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS SHIPPING_DETAIL;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS ADDRESS;

CREATE TABLE ADDRESS (
ID INTEGER AUTO_INCREMENT,
ZIPCODE VARCHAR(25),
WIDECIDO VARCHAR(25),
CIGOONGU VARCHAR(25),
STREETNAME VARCHAR(25),
BUILDINGNO VARCHAR(25),
UNITNO VARCHAR(25),
PRIMARY KEY(ID)
);

CREATE TABLE CUSTOMER (
ID INTEGER AUTO_INCREMENT,
NAME VARCHAR(25),
PHONE_NUMBER VARCHAR(25),
BILLING_ADDRESS_ID INTEGER,
PRIMARY KEY(ID),
CONSTRAINT address_FK FOREIGN KEY (BILLING_ADDRESS_ID)
REFERENCES ADDRESS(ID)
);

CREATE TABLE SHIPPING_DETAIL (
ID INTEGER AUTO_INCREMENT,
NAME VARCHAR(25),
SHIPPING_DATE VARCHAR(25),
SHIPPING_ADDRESS_ID INTEGER,
PRIMARY KEY (ID),
CONSTRAINT shcustomersip_addr_ID_FK FOREIGN KEY
(SHIPPING_ADDRESS_ID) REFERENCES ADDRESS(ID)
);

CREATE TABLE ORDERS (
ID INTEGER AUTO_INCREMENT,
CART_ID VARCHAR(50),
CUSTOMER_ID INTEGER,
SHIPPING_DETAIL_ID INTEGER,
PRIMARY KEY (ID),
CONSTRAINT order_cart_FK FOREIGN KEY (CART_ID) REFERENCES
CART(ID),
CONSTRAINT customer_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES
CUSTOMER(ID),
CONSTRAINT ship_detail_FK FOREIGN KEY (SHIPPING_DETAIL_ID)
REFERENCES SHIPPING_DETAIL(ID)
);
ALTER TABLE ORDERS AUTO_INCREMENT=1000;