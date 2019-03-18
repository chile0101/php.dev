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


CREATE TABLE type_product(
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255),
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO type_product (id,name) VALUES (NULL,'Action');
INSERT INTO type_product (id,name) VALUES (NULL,'Advanture');
INSERT INTO type_product (id,name) VALUES (NULL,'Casual');
INSERT INTO type_product (id,name) VALUES (NULL,'Indie');


CREATE TABLE products (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    image varchar(255) NOT NULL,
    priceold decimal(5,1) NOT NULL,
    pricenew decimal(5,1) NOT NULL,
    code varchar(20) NOT NULL,
    description text ,
    link_origin text,
    date_release text,
    developer varchar(255),
    link_trailer text,
    type_product_id int(11) NOT NULL,
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at datetime,
    -- size,color,category
    FOREIGN KEY (type_product_id) REFERENCES type_product(id) 
);

INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'ARK: Survival Evolved','https://s3-ap-southeast-1.amazonaws.com/htcstore/gam1.png',371,149,'vncur 346110','As a man or woman stranded naked, freezing & starving on a mysterious island, you must hunt, harvest, craft items, grow crops, & build shelters to survive. Use skill & cunning to kill, tame, breed, & ride Dinosaurs & primeval creatures living on ARK, and team up with hundreds of players or play locally!',
            'https://store.steampowered.com/app/346110/ARK_Survival_Evolved/','28 Aug 2017','Studio Wildcard','aQM8yWoiy5s',1);


INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Left 4 Dead 2','https://s3-ap-southeast-1.amazonaws.com/htcstore/game2.png',
            371,115,'vncur 550 idcur','Set in the zombie apocalypse, Left 4 Dead 2 (L4D2) is the highly anticipated sequel to the award-winning Left 4 Dead, the #1 co-op game of 2008. This co-operative action horror FPS takes you and your friends through the cities, swamps and cemeteries of the Deep South, from Savannah to New Orleans ',
            'https://store.steampowered.com/app/550/Left_4_Dead_2/','17 Nov, 2009','Valve','9XIle_kLHKU',1);


INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Forest','https://s3-ap-southeast-1.amazonaws.com/htcstore/game3.png',
            256,120,'vncur 644','As a man or woman stranded naked, freezing & starving on a mysterious island, you must hunt, harvest, craft items, grow crops, & build shelters to survive. Use skill & cunning to kill, tame, breed, & ride Dinosaurs & primeval creatures living on ARK, and team up with hundreds of players or play locally!',
            'https://store.steampowered.com/agecheck/app/242760/','28 Aug 2017','Studio Wildcard',"76dHkDhOZ04",1);


INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Terraria','https://s3-ap-southeast-1.amazonaws.com/htcstore/game4.png',371,149,
            'vncur 105600 vncur','Dig, fight, explore, build! Nothing is impossible in this action-packed adventure game. Four Pack also available!',
            'https://store.steampowered.com/app/105600/Terraria/','17 May, 2011','Re-Logic','w7uOhFTrrq0',1);


CREATE TABLE orders (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id int(11) NOT NULL,
    product_id int(11) NOT NULL,
    quantity int(11) NOT NULL,
    status int(1) NOT NULL,
    create_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at datetime,
    FOREIGN KEY (product_id)  REFERENCES products(id),
    FOREIGN KEY (user_id) REFERENCES users(id) 
);

INSERT INTO orders(id,user_id,product_id,quantity,status)
        VALUES  (NULL,1,1,4,1);



-- CREATE TABLE contact_us(
--     id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
--     name varchar(255),
--     email varchar(255) NOT NULL,
--     subject varchar(255),
--     message text,
--     create_at datetime DEFAULT CURRENT_TIMESTAMP
-- );
-- INSERT INTO contact_us(id, name, email, subject, message) VALUES (NULL, 'John Brah','johnbrah@gmail.com','T-shirt','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.');
