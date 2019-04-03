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


INSERT INTO type_product (id,name) VALUES (1,'Hành Động');
INSERT INTO type_product (id,name) VALUES (2,'Kinh Dị');
INSERT INTO type_product (id,name) VALUES (3,'Thể Thao');
INSERT INTO type_product (id,name) VALUES (4,'Nhập Vai');
INSERT INTO type_product (id,name) VALUES (5,'Đối Kháng');

/* -------------------------------------------Hành Động------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Grand Theft Auto V','https://hb.imgix.net/ad3f96dfd21531e24ab72c3821a01049c8484982.jpg?auto=compress,format&fit=crop&h=353&w=616&s=9fc123b4c723d329d164b8ab02af5284',
            459,300,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/271590/Grand_Theft_Auto_V/','2013-09-17','Rockstar','YrtCnL62pB8',1);

INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Devil May Cry 5','https://steamcdn-a.akamaihd.net/steam/apps/601150/header.jpg?t=1553635207',
            800,795,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/550/Left_4_Dead_2/','2019-09-17','CAPCOM','MWxlbnI9mpU',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Tom Clancy The Devision','https://hb.imgix.net/b7768391be1f703cc59899948b552adfacdb1976.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6ba76d1681712e2258ecb34a58fefa12',
            825,605,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/365590/Tom_Clancys_The_Division/','2016-09-17','Ubisoft','uElsBflqgYw',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Watch Dogs 2','https://cdn.chip.gen.tr/images/content/2016121104062625446/watch-dogs-2-inceleme.jpg',
            800,420,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/447040/Watch_Dogs_2/','2016-09-17','Ubisoft','hh9x4NqW0Dw',1);			
/* -------------------------------------------Kinh Dị------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Outlast 2','https://images.gog.com/409993ae05dfa48caa30943b3d2f97cd0f462e0da9fca81edff85cc6a957fe3d_product_card_v2_mobile_slider_639.jpg',
            420,320,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/414700/Outlast_2/','2017-09-17','Red Barrels','QTM2655BA6U',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Home Sweet Home','https://steamcdn-a.akamaihd.net/steam/apps/617160/header.jpg?t=1544779603',
            371,94,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/617160/Home_Sweet_Home/','2017-09-17','YGGDRAZIL GROUP','R-vYl7grT5Q',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Resident Evil 7 ','https://cdn.cdkeys.com/500x706/media/catalog/product/r/e/resident_evil_7_-_biohazard_cover.jpg',
            900,700,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/418370/RESIDENT_EVIL_7_biohazard__BIOHAZARD_7_resident_evil/','2017-09-17','CAPCOM','W1OUs3HwIuo',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Resident Evil 2 Remake','https://genknews.genkcdn.vn/2019/3/4/1-1551670114758393408513.jpg',
            1100,900,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/883710/RESIDENT_EVIL_2__BIOHAZARD_RE2/','2019-09-17','CAPCOM','u3wS-Q2KBpk',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Little Nightmares','https://hb.imgix.net/7053ec649ae54173f01ce24015a00976a4f958d6.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6ff070f396d7f472d94d27d2692a308f',
            240,110,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/424840/Little_Nightmares/','2017-09-17','BANDAI','aOadxZBsPiA',2);			
/* -------------------------------------------Thể Thao------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Rocket League','https://steamcdn-a.akamaihd.net/steam/apps/252950/header.jpg?t=1553116050',
            256,120,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/252950/Rocket_League/','2015-02-28','Psyonix',"Vawwy2eu5sA",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'WWE 2K18','https://steamcdn-a.akamaihd.net/steam/apps/664430/header.jpg?t=1534550792',
            300,150,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/664430/WWE_2K18/','2017-02-28','Visual Concepts',"7ZbZfsuLXtg",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Beat Saber','https://steamcdn-a.akamaihd.net/steam/apps/620980/header.jpg?t=1543281439',
            800,780,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/620980/Beat_Saber/','2018-02-28','Beat Games',"pa4vrynwkwY",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'NBA 2k17','https://steamcdn-a.akamaihd.net/steam/apps/385760/header.jpg?t=1542134244',
            320,120,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/385760/NBA_2K17/','2016-02-28','Visual Concepts',"cQKDcMxTAfw",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'WRC 7 FIA World Rally Championship','https://steamcdn-a.akamaihd.net/steam/apps/621830/header.jpg?t=1538038559',
            400,220,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/621830/WRC_7_FIA_World_Rally_Championship/','2017-02-28','KT Racing',"sjoEGhY89Q",3);			
/* -------------------------------------------Nhập Vai------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Elder Scrolls V: Skyrim','https://steamcdn-a.akamaihd.net/steam/apps/489830/header.jpg?t=1533676854',
            300,120,'vncur 644','​Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/','2016-02-28','Bethesda Game Studios',"JSRtYpNRoN0",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Witcher 3: Wild Hunt','https://steamcdn-a.akamaihd.net/steam/apps/292030/header.jpg?t=1550078557',
            400,300,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/292030/The_Witcher_3_Wild_Hunt/','2015-02-28','CD PROJEKT RED',"ehjJ614QfeM",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Sekiro: Shadows Die Twice','https://steamcdn-a.akamaihd.net/steam/apps/814380/header.jpg?t=1553906171',
            1200,1100,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice/','2019-02-28','Activision',"aUnEezrBFoA",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Dark Souls 3','https://steamcdn-a.akamaihd.net/steam/apps/374320/header.jpg?t=1553251330',
            800,620,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/374320/DARK_SOULS_III/','2016-02-28','
            FromSoftware',"zDZYrIUgKE",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'https://us.diablo3.com/en/','https://images.g2a.com/newlayout/600x351/1x1x0/f4440f6cc460/5a141651ae653a29cc660b5e',
            800,720,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://us.diablo3.com/en/','2013-02-28','Blizzard Entertainment ',"NWa41eJjr0c",4);			
/* -------------------------------------------Đối Kháng------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Mortal Kombat X','https://steamcdn-a.akamaihd.net/steam/apps/307780/header.jpg?t=1551909865',
            900,720,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/307780/Mortal_Kombat_X/','2015-02-28','NetherRealm Studios',"jSi2LDkyKmI",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Injustice: Gods Among Us Ultimate Edition','https://steamcdn-a.akamaihd.net/steam/apps/242700/header.jpg?t=1545176902',
            800,520,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay! ','https://store.steampowered.com/app/242700/Injustice_Gods_Among_Us_Ultimate_Edition/','2013-02-28','NetherRealm Studios',"hMkTQSbE6Bc",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Street Fighter V','https://steamcdn-a.akamaihd.net/steam/apps/310950/header.jpg?t=1553630183',
            200,90,'vncur 644','',
            'https://store.steampowered.com/app/310950/Street_Fighter_V/','2016-02-28','Capcom',"0nFd7Iylj5A",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'JUMP FORCE','https://steamcdn-a.akamaihd.net/steam/apps/816020/header.jpg?t=1553188281',
            1100,920,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/816020/JUMP_FORCE/','2019-02-28','BANDAI NAMCO Entertainment',"7U50iYupwBE",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'NARUTO SHIPPUDEN: Ultimate Ninja STORM Revolution','https://steamcdn-a.akamaihd.net/steam/apps/272510/header.jpg?t=1447360052',
            400,120,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/272510/NARUTO_SHIPPUDEN_Ultimate_Ninja_STORM_Revolution/','2014-02-28','BANDAI NAMCO Entertainment',"1NKBruhXn-8",5);			







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

