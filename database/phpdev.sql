CREATE DATABASE db_phpdev;
USE db_phpdev;

CREATE TABLE admins (
    id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY (id)
);
INSERT INTO admins (id,email, password) VALUES (null,'admin@gmail.com', '123456');


CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NOT NULL,
    phone VARCHAR(11) ,
    address TINYTEXT,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY(id)
);

INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'chi@gmail.com', '123456', 'Tom', '0395669219', 'HCM');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'chile@gmail.com', '123456', 'ChiLe', '0395669219', 'HCM');

CREATE TABLE type_product(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(255),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY(id)
);

INSERT INTO type_product (id,name) VALUES (NULL,'Action');
INSERT INTO type_product (id,name) VALUES (NULL,'Advanture');
INSERT INTO type_product (id,name) VALUES (NULL,'Casual');
INSERT INTO type_product (id,name) VALUES (NULL,'Indie');


CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    image TINYTEXT NOT NULL,
    priceold decimal(5,1) NOT NULL,
    pricenew decimal(5,1) NOT NULL,
    code VARCHAR(20) NOT NULL,
    description TINYTEXT ,
    link_origin TINYTEXT,
    date_release DATE,         
    developer VARCHAR(255),
    link_trailer TINYTEXT,
    type_product_id INT UNSIGNED NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (type_product_id) REFERENCES type_product(id) 
);

INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'ARK Survival Evolved','https://s3-ap-southeast-1.amazonaws.com/htcstore/gam1.png',371,149,'vncur 346110','As a man or woman stranded naked, freezing & starving on a mysterious island, you must hunt, harvest, craft items, grow crops, & build shelters to survive. Use skill & cunning to kill, tame, breed, & ride Dinosaurs & primeval creatures living on ARK, and team up with hundreds of players or play locally!',
            'https://store.steampowered.com/app/346110/ARK_Survival_Evolved/','2017-12-08','Studio Wildcard','aQM8yWoiy5s',1);


INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Left 4 Dead 2','https://s3-ap-southeast-1.amazonaws.com/htcstore/game2.png',
            371,115,'vncur 550 idcur','Set in the zombie apocalypse, Left 4 Dead 2 (L4D2) is the highly anticipated sequel to the award-winning Left 4 Dead, the #1 co-op game of 2008. This co-operative action horror FPS takes you and your friends through the cities, swamps and cemeteries of the Deep South, from Savannah to New Orleans ',
            'https://store.steampowered.com/app/550/Left_4_Dead_2/','2009-09-17','Valve','9XIle_kLHKU',1);


INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Forest','https://s3-ap-southeast-1.amazonaws.com/htcstore/game3.png',
            256,120,'vncur 644','As a man or woman stranded naked, freezing & starving on a mysterious island, you must hunt, harvest, craft items, grow crops, & build shelters to survive. Use skill & cunning to kill, tame, breed, & ride Dinosaurs & primeval creatures living on ARK, and team up with hundreds of players or play locally!',
            'https://store.steampowered.com/agecheck/app/242760/','2017-02-28','Studio Wildcard',"76dHkDhOZ04",1);


INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Terraria','https://s3-ap-southeast-1.amazonaws.com/htcstore/game4.png',371,149,
            'vncur 105600 vncur','Dig, fight, explore, build! Nothing is impossible in this action-packed adventure game. Four Pack also available!',
            'https://store.steampowered.com/app/105600/Terraria/','2018-12-01','Re-Logic','w7uOhFTrrq0',1);


CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

INSERT INTO orders(user_id) 
       VALUES (1)

CREATE TABLE orderitems(
    id INT UNSIGNED AUTO_INCREMENT,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)

);

CREATE TABLE reviews(
    
    user_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(product_id) REFERENCES products(id)

);


CREATE TABLE contact_us(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    subject VARCHAR(255),
    message text,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);
-- INSERT INTO contact_us(id, name, email, subject, message) VALUES (NULL, 'John Brah','johnbrah@gmail.com','T-shirt','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');
