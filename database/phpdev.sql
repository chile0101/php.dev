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
            VALUES (NULL, 'chi@gmail.com', '1234', 'chil le', '1695669219', 'KTX KHu B');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'ha@gmail.com', '1234', 'ha vo', '1695669219', 'KTX KHu B');


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
            VALUES (NULL,'T-Shirt','assets/images/products/man/1.jpg',25.2,'001',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/2.jpg',134.24,'002',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/3.jpg',24.2,'003',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/4.jpg',25.2,'004',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/5.jpg',25.2,'005',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/6.jpg',25.2,'006',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/7.jpg',25.2,'007',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/8.jpg',25.2,'008',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/9.jpg',25.2,'009',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/10.jpg',25.2,'010',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/11.jpg',25.2,'011',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/12.jpg',25.2,'012',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/13.jpg',25.2,'013',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/14.jpg',25.2,'014',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/15.jpg',25.2,'015',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/16.jpg',25.2,'016',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/17.jpg',25.2,'017',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/18.jpg',25.2,'018',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/19.jpg',25.2,'019',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/20.jpg',25.2,'020',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/21.jpg',25.2,'021',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/22.jpg',25.2,'022',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/23.jpg',25.2,'023',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/24.jpg',25.2,'024',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/25.jpg',25.2,'025',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/26.jpg',25.2,'026',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/27.jpg',25.2,'027',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/28.jpg',25.2,'028',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/29.jpg',25.2,'029',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'T-Shirt','assets/images/products/man/30.jpg',25.2,'030',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',1);

-- ==================================================================================================
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal','assets/images/products/woman/1.jpg',12.1,'100',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/2.jpg',30.5,'101',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);
INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/3.jpg',29.7,'102',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/4.jpg',35.9,'103',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/5.jpg',140.5,'104',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/6.jpg',38,'105',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/7.jpg',26.4,'106',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/8.jpg',21.5,'107',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/9.jpg',45,'108',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/10.jpg',25.2,'109',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/11.jpg',20.8,'110',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/12.jpg',100.2,'111',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/13.jpg',25.2,'112',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/14.jpg',25.2,'113',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/15.jpg',78.2,'114',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/16.jpg',25.2,'115',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/17.jpg',24.6,'116',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/18.jpg',18.4,'117',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/19.jpg',18.4,'118',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);

INSERT INTO products (id,name,image,price,code,description,type_gender_id)
            VALUES (NULL,'SHEIN Tribal ','assets/images/products/woman/20.jpg',19.5,'119',
            'This Hanes classic is comfortable, stylish and versatile. Perfect as an outer or under layer, the men hooded sweatshirt has become a staple in any wardrobe. Kangaroo-style front pocket is perfect for your phone, keys or anything else you want to stash.',2);



CREATE TABLE orders (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    total int(11),
    FOREIGN KEY (user_id) REFERENCES users(id) 
);
INSERT INTO orders (id,user_id,total) VALUES (NULL,1,149.44);

CREATE TABLE orders_products(
    order_id int(11) NOT NULL,
    product_id int(11) NOT NULL,
    quantity int(11) NOT NULL,
    FOREIGN KEY (product_id)  REFERENCES products(id)
);
INSERT INTO orders_products (order_id,product_id,quantity) VALUES (1,1,1);
INSERT INTO orders_products (order_id,product_id,quantity) VALUES (1,2,1);

