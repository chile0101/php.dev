DROP DATABASE IF EXISTS db_phpdev;
CREATE DATABASE db_phpdev;
USE db_phpdev;
/* ----------------------------------------INIT TABLE------------------------------------------------- */
CREATE TABLE admins ( 
    id INT UNSIGNED AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY (id)
);

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

CREATE TABLE type_product(
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(255),
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY(id)
);

CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    image TINYTEXT NOT NULL,
    priceold DECIMAL(5,1) NOT NULL,
    pricenew DECIMAL(5,1) NOT NULL,
    code VARCHAR(20) NOT NULL,
    description TINYTEXT ,
    link_origin TINYTEXT,
    date_release DATE,         
    developer VARCHAR(255),
    link_trailer TINYTEXT,
    rating_avg DECIMAL(1,1),
    type_product_id INT UNSIGNED NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,
    PRIMARY KEY(id),
    FOREIGN KEY (type_product_id) REFERENCES type_product(id) 
);

CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id)
);

CREATE TABLE orderitems(
    id INT UNSIGNED AUTO_INCREMENT,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    quantity SMALLINT UNSIGNED NOT NULL,

    PRIMARY KEY(id),
    FOREIGN KEY(order_id) REFERENCES orders(id),
    FOREIGN KEY(product_id) REFERENCES products(id)

);

-- Many to many nhung mot nguoi chi dc 1 review cho 1 sp
CREATE TABLE reviews(

    user_id INT UNSIGNED ,
    product_id INT UNSIGNED ,
    rating FLOAT DEFAULT 0,
    content TEXT NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(product_id) REFERENCES products(id),
    PRIMARY KEY(user_id,product_id)

);
-- One to One with products
CREATE TABLE ratings (
    product_id INT UNSIGNED,
    positive FLOAT NOT NULL DEFAULT 0,
    negative FLOAT NOT NULL DEFAULT 0,
    stars FLOAT DEFAULT 0,
    total INT NOT NULL,
    lower_bound FLOAT DEFAULT NULL,
    PRIMARY KEY (product_id),
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

/* -------------------------------------------TRIGGER------------------------------------------------- */

DELIMITER $$

-- insert 1 product -> insert 1 rating of product
CREATE TRIGGER insert_product AFTER INSERT ON products
FOR EACH ROW 
BEGIN 
    INSERT INTO ratings
SET
    product_id = NEW.id;
END$$

 -- dedete 1 product -> delete 1 rating 
CREATE TRIGGER delete_product BEFORE DELETE ON products
FOR EACH ROW 
BEGIN 
    DELETE FROM ratings 
    WHERE ratings.product_id = OLD.id;
END$$

-- update rating
CREATE TRIGGER update_rating BEFORE UPDATE ON ratings
FOR EACH ROW
SET new.total = new.positive + new.negative,
    new.stars = ROUND( (((new.positive / new.total) * 4) + 1) * 2, 0) / 2,
    new.lower_bound = ((new.positive + 1.9208) / (new.positive + new.negative) - 1.96 * SQRT((new.positive * new.negative) / (new.positive + new.negative) + 0.9604) / (new.positive + new.negative)) / (1 + 3.8416 / (new.positive + new.negative));

DELIMITER ;
/* -------------------------------------------INSERT------------------------------------------------- */



-- INSERT INTO contact_us(id, name, email, subject, message) VALUES (NULL, 'John Brah','johnbrah@gmail.com','T-shirt','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');

INSERT INTO admins (id,email, password) VALUES (null,'admin@gmail.com', '123456');

INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'chilevan74@gmail.com', MD5('123456'), 'CHILEVAN', '0395669219', 'HCM');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'levanchi74@gmail.com', MD5('123456'), 'LEVANCHI', '0395669219', 'HCM');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'tom@gmail.com', MD5('123456'), 'TOM', '0425669412', 'HCM');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'chile@gmail.com', MD5('123456'), 'CHILE', '0395669124', 'HCM');
INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'huynh@gmail.com', MD5('123456'), 'HUYNH', '0395669216', 'HCM');


INSERT INTO type_product (id,name) VALUES (NULL,'Action');
INSERT INTO type_product (id,name) VALUES (NULL,'Advanture');
INSERT INTO type_product (id,name) VALUES (NULL,'Casual');
INSERT INTO type_product (id,name) VALUES (NULL,'Indie');



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



INSERT INTO orders(id,user_id) VALUES(null,1);
INSERT INTO orders(id,user_id) VALUES(null,2);

INSERT INTO orderitems(order_id,product_id,quantity) VALUES (1,1,2);

-- INSERT INTO reviews(user_id,product_id,rating,content)
--         VALUES (1,1,4,"Excellent game. Traffic and people mechanics make the game much richer than other similar titles. Very good to exercise your creativity while keeping logic to avoid traffic jams, pollution and other service failures.");

-- INSERT INTO reviews(user_id,product_id,rating,content)
--         VALUES (2,1,5,"Excellent game. Traffic and people mechanics make the game much richer than other similar titles. Very good to exercise your creativity while keeping logic to avoid traffic jams, pollution and other service failures.");

-- INSERT INTO reviews(user_id,product_id,rating,content)
--         VALUES (1,2,4.5,"Excellent game. Traffic and people mechanics make the game much richer than other similar titles. Very good to exercise your creativity while keeping logic to avoid traffic jams, pollution and other service failures.");
-- INSERT INTO reviews(user_id,product_id,rating,content)
--         VALUES (2,2,4,"Excellent game. Traffic and people mechanics make the game much richer than other similar titles. Very good to exercise your creativity while keeping logic to avoid traffic jams, pollution and other service failures.");

-- UPDATE ratings SET negative = negative + 0.25, positive = positive + 0.75 WHERE product_id=1;  -- 4 start
-- UPDATE ratings SET negative = negative + 0, positive = positive + 1 WHERE product_id=1;  --