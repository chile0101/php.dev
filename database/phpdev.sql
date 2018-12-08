CREATE DATABASE db_phpdev;
USE db_phpdev;

CREATE TABLE admins (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO admins (id,email, password) VALUES (null,'admin@gmail.com', '1');
INSERT INTO admins (id,email, password) VALUES (null,'chile@gmail.com', '1');

CREATE TABLE users (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    fullname varchar(255),
    phone varchar(11),
    address text,
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at datetime
);

INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'user@gmail.com', '1234', 'chil le', '1695669219', 'KTX KHu B');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'user@gmail.com', '1234', 'chil le', '1695669219', 'KTX KHu B');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'user@gmail.com', '1234', 'chil le', '1695669219', 'KTX KHu B');           
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'user@gmail.com', '1234', 'chil le', '1695669219', 'KTX KHu B');

CREATE TABLE type_gender(
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255),
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO type_gender (id,name) VALUES (NULL,'man');
INSERT INTO type_gender (id,name) VALUES (NULL,'woman');

CREATE TABLE products (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    image varchar(255) NOT NULL,
    price int(10) NOT NULL,
    code varchar(20) NOT NULL,
    description text ,
    type_gender_id int(11) NOT NULL,
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at datetime,
    -- size,color,category
    FOREIGN KEY (type_gender_id) REFERENCES type_gender(id) 
);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'Áo Thun Nam KiriMaru Basic AA10','assets/images/products/man/aothun1.jpg',250,'0016686001',
            'description',1);
