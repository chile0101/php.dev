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

INSERT INTO users (id, email, password, fullname, phone, address) 
            VALUES (NULL, 'huynh@gmail.com', MD5('123456'), 'Tom Nguyen', '0395669216', 'HCM');

INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lechi01@gmail.com',MD5('123'),'lechi01','0391037813','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letho@gmail.com',MD5('123'),'letho','0375345747','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lehuynh@gmail.com',MD5('123'),'lehuynh','0370179722','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lethinh@gmail.com',MD5('123'),'lethinh','0866528799','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lethienxyz@gmail.com',MD5('123'),'lethienxyz','0864799958','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lehuong9x@gmail.com',MD5('123'),'lehuong9x','0967531407','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'leha@gmail.com',MD5('123'),'leha','0372075252','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lethao@gmail.com',MD5('123'),'lethao','0866018865','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lengoc@gmail.com',MD5('123'),'lengoc','0970209020','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lenam@gmail.com',MD5('123'),'lenam','0339418363','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letuan97@gmail.com',MD5('123'),'letuan97','0365648301','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lehong@gmail.com',MD5('123'),'lehong','0338246183','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lety@gmail.com',MD5('123'),'lety','0382389691','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lehai@gmail.com',MD5('123'),'lehai','0399691925','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lehau@gmail.com',MD5('123'),'lehau','0386191892','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letuan@gmail.com',MD5('123'),'letuan','0974481397','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letinh@gmail.com',MD5('123'),'letinh','0970468022','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'leloc@gmail.com',MD5('123'),'leloc','0336807620','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'levietanh97@gmail.com',MD5('123'),'levietanh97','0969334347','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letiem@gmail.com',MD5('123'),'letiem','0332601665','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lethiem@gmail.com',MD5('123'),'lethiem','0987879430','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lenga@gmail.com',MD5('123'),'lenga','0349269236','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'levuui@gmail.com',MD5('123'),'levuui','0354762160','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lesuong@gmail.com',MD5('123'),'lesuong','0983805517','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'leloan@gmail.com',MD5('123'),'leloan','0351176517','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'leandrew@gmail.com',MD5('123'),'leandrew','0869190775','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lethai123@gmail.com',MD5('123'),'lethai123','0351603030','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'levi51@gmail.com',MD5('123'),'levi51','0971476203','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'leson@gmail.com',MD5('123'),'leson','0347275945','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lethang92@gmail.com',MD5('123'),'lethang92','0383830340','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lekim@gmail.com',MD5('123'),'lekim','0367989015','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lelien87@gmail.com',MD5('123'),'lelien87','0335649404','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letong@gmail.com',MD5('123'),'letong','0375603250','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'legiang@gmail.com',MD5('123'),'legiang','0977796145','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letongbk@gmail.com',MD5('123'),'letongbk','0340055339','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'letay@gmail.com',MD5('123'),'letay','0330662988','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lemon96@gmail.com',MD5('123'),'lemon96','0349180896','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'lekhanh@gmail.com',MD5('123'),'lekhanh','0868016656','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranchi01@gmail.com',MD5('123'),'tranchi01','0863187709','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantho@gmail.com',MD5('123'),'trantho','0968771669','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranhuynh@gmail.com',MD5('123'),'tranhuynh','0330280882','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranthinh@gmail.com',MD5('123'),'tranthinh','0333017258','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranthienxyz@gmail.com',MD5('123'),'tranthienxyz','0347381565','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranhuong9x@gmail.com',MD5('123'),'tranhuong9x','0352571286','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranha@gmail.com',MD5('123'),'tranha','0970310240','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranthao@gmail.com',MD5('123'),'tranthao','0965024663','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranngoc@gmail.com',MD5('123'),'tranngoc','0341996537','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trannam@gmail.com',MD5('123'),'trannam','0970701947','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantuan97@gmail.com',MD5('123'),'trantuan97','0366948030','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranhong@gmail.com',MD5('123'),'tranhong','0863473247','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranty@gmail.com',MD5('123'),'tranty','0358567154','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranhai@gmail.com',MD5('123'),'tranhai','0974618519','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranhau@gmail.com',MD5('123'),'tranhau','0322679823','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantuan@gmail.com',MD5('123'),'trantuan','0368759971','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantinh@gmail.com',MD5('123'),'trantinh','0365122938','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranloc@gmail.com',MD5('123'),'tranloc','0363441166','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranvietanh97@gmail.com',MD5('123'),'tranvietanh97','0396588493','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantiem@gmail.com',MD5('123'),'trantiem','0356566151','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranthiem@gmail.com',MD5('123'),'tranthiem','0978417345','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trannga@gmail.com',MD5('123'),'trannga','0970512596','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranvuui@gmail.com',MD5('123'),'tranvuui','0375916980','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'transuong@gmail.com',MD5('123'),'transuong','0354958389','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranloan@gmail.com',MD5('123'),'tranloan','0364981281','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranandrew@gmail.com',MD5('123'),'tranandrew','0961035141','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranthai123@gmail.com',MD5('123'),'tranthai123','0381259033','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranvi51@gmail.com',MD5('123'),'tranvi51','0981256453','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'transon@gmail.com',MD5('123'),'transon','0860740215','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranthang92@gmail.com',MD5('123'),'tranthang92','0342271109','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trankim@gmail.com',MD5('123'),'trankim','0983526320','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranlien87@gmail.com',MD5('123'),'tranlien87','0981887724','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantong@gmail.com',MD5('123'),'trantong','0960498168','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trangiang@gmail.com',MD5('123'),'trangiang','0363025991','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantongbk@gmail.com',MD5('123'),'trantongbk','0351045531','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trantay@gmail.com',MD5('123'),'trantay','0335552311','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'tranmon96@gmail.com',MD5('123'),'tranmon96','0341448389','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'trankhanh@gmail.com',MD5('123'),'trankhanh','0356494976','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenchi01@gmail.com',MD5('123'),'nguyenchi01','0978347179','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentho@gmail.com',MD5('123'),'nguyentho','0971476279','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenhuynh@gmail.com',MD5('123'),'nguyenhuynh','0337664018','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenthinh@gmail.com',MD5('123'),'nguyenthinh','0869488918','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenthienxyz@gmail.com',MD5('123'),'nguyenthienxyz','0339377942','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenhuong9x@gmail.com',MD5('123'),'nguyenhuong9x','0334614572','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenha@gmail.com',MD5('123'),'nguyenha','0968713279','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenthao@gmail.com',MD5('123'),'nguyenthao','0353344889','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenngoc@gmail.com',MD5('123'),'nguyenngoc','0972943262','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyennam@gmail.com',MD5('123'),'nguyennam','0398975895','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentuan97@gmail.com',MD5('123'),'nguyentuan97','0359625208','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenhong@gmail.com',MD5('123'),'nguyenhong','0362823211','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenty@gmail.com',MD5('123'),'nguyenty','0864461184','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenhai@gmail.com',MD5('123'),'nguyenhai','0343254559','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenhau@gmail.com',MD5('123'),'nguyenhau','0383107430','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentuan@gmail.com',MD5('123'),'nguyentuan','0367700176','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentinh@gmail.com',MD5('123'),'nguyentinh','0338254028','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenloc@gmail.com',MD5('123'),'nguyenloc','0372206276','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenvietanh97@gmail.com',MD5('123'),'nguyenvietanh97','0970897216','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentiem@gmail.com',MD5('123'),'nguyentiem','0341841485','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenthiem@gmail.com',MD5('123'),'nguyenthiem','0989788768','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyennga@gmail.com',MD5('123'),'nguyennga','0329988560','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenvuui@gmail.com',MD5('123'),'nguyenvuui','0399504483','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyensuong@gmail.com',MD5('123'),'nguyensuong','0979596048','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenloan@gmail.com',MD5('123'),'nguyenloan','0372959289','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenandrew@gmail.com',MD5('123'),'nguyenandrew','0393557533','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenthai123@gmail.com',MD5('123'),'nguyenthai123','0393181041','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenvi51@gmail.com',MD5('123'),'nguyenvi51','0988834734','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenson@gmail.com',MD5('123'),'nguyenson','0394430329','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenthang92@gmail.com',MD5('123'),'nguyenthang92','0864959849','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenkim@gmail.com',MD5('123'),'nguyenkim','0369139928','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenlien87@gmail.com',MD5('123'),'nguyenlien87','0349148617','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentong@gmail.com',MD5('123'),'nguyentong','0383239384','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyengiang@gmail.com',MD5('123'),'nguyengiang','0861451639','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentongbk@gmail.com',MD5('123'),'nguyentongbk','0338621596','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyentay@gmail.com',MD5('123'),'nguyentay','0368527155','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenmon96@gmail.com',MD5('123'),'nguyenmon96','0860699214','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'nguyenkhanh@gmail.com',MD5('123'),'nguyenkhanh','0343687572','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamchi01@gmail.com',MD5('123'),'phamchi01','0977900017','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtho@gmail.com',MD5('123'),'phamtho','0862176975','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhuynh@gmail.com',MD5('123'),'phamhuynh','0343622890','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthinh@gmail.com',MD5('123'),'phamthinh','0322810758','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthienxyz@gmail.com',MD5('123'),'phamthienxyz','0973629264','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhuong9x@gmail.com',MD5('123'),'phamhuong9x','0864792831','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamha@gmail.com',MD5('123'),'phamha','0380375700','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthao@gmail.com',MD5('123'),'phamthao','0979322199','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamngoc@gmail.com',MD5('123'),'phamngoc','0346361329','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamnam@gmail.com',MD5('123'),'phamnam','0980784127','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtuan97@gmail.com',MD5('123'),'phamtuan97','0361436048','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhong@gmail.com',MD5('123'),'phamhong','0359360517','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamty@gmail.com',MD5('123'),'phamty','0967273620','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhai@gmail.com',MD5('123'),'phamhai','0376440519','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhau@gmail.com',MD5('123'),'phamhau','0329764721','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtuan@gmail.com',MD5('123'),'phamtuan','0377007190','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtinh@gmail.com',MD5('123'),'phamtinh','0369827998','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamloc@gmail.com',MD5('123'),'phamloc','0353158887','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamvietanh97@gmail.com',MD5('123'),'phamvietanh97','0975992177','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtiem@gmail.com',MD5('123'),'phamtiem','0972574187','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthiem@gmail.com',MD5('123'),'phamthiem','0976638955','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamnga@gmail.com',MD5('123'),'phamnga','0391935838','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamvuui@gmail.com',MD5('123'),'phamvuui','0372839152','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamsuong@gmail.com',MD5('123'),'phamsuong','0334790572','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamloan@gmail.com',MD5('123'),'phamloan','0340974920','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamandrew@gmail.com',MD5('123'),'phamandrew','0397409443','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthai123@gmail.com',MD5('123'),'phamthai123','0353820119','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamvi51@gmail.com',MD5('123'),'phamvi51','0342684302','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamson@gmail.com',MD5('123'),'phamson','0356536695','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthang92@gmail.com',MD5('123'),'phamthang92','0384809182','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamkim@gmail.com',MD5('123'),'phamkim','0365998754','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamlien87@gmail.com',MD5('123'),'phamlien87','0970169231','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtong@gmail.com',MD5('123'),'phamtong','0978416482','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamgiang@gmail.com',MD5('123'),'phamgiang','0970631947','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtongbk@gmail.com',MD5('123'),'phamtongbk','0349136477','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtay@gmail.com',MD5('123'),'phamtay','0348630873','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phammon96@gmail.com',MD5('123'),'phammon96','0335645830','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamkhanh@gmail.com',MD5('123'),'phamkhanh','0964118322','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangchi01@gmail.com',MD5('123'),'hoangchi01','0363245483','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtho@gmail.com',MD5('123'),'hoangtho','0344612124','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanghuynh@gmail.com',MD5('123'),'hoanghuynh','0338331233','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangthinh@gmail.com',MD5('123'),'hoangthinh','0353318439','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangthienxyz@gmail.com',MD5('123'),'hoangthienxyz','0972954936','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanghuong9x@gmail.com',MD5('123'),'hoanghuong9x','0964022728','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangha@gmail.com',MD5('123'),'hoangha','0967328771','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangthao@gmail.com',MD5('123'),'hoangthao','0330730631','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangngoc@gmail.com',MD5('123'),'hoangngoc','0971138108','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangnam@gmail.com',MD5('123'),'hoangnam','0337477400','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtuan97@gmail.com',MD5('123'),'hoangtuan97','0333529098','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanghong@gmail.com',MD5('123'),'hoanghong','0384319688','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangty@gmail.com',MD5('123'),'hoangty','0323418451','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanghai@gmail.com',MD5('123'),'hoanghai','0989781779','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanghau@gmail.com',MD5('123'),'hoanghau','0865364794','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtuan@gmail.com',MD5('123'),'hoangtuan','0968982814','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtinh@gmail.com',MD5('123'),'hoangtinh','0355512978','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangloc@gmail.com',MD5('123'),'hoangloc','0963757017','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangvietanh97@gmail.com',MD5('123'),'hoangvietanh97','0868633328','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtiem@gmail.com',MD5('123'),'hoangtiem','0329358760','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangthiem@gmail.com',MD5('123'),'hoangthiem','0989959661','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangnga@gmail.com',MD5('123'),'hoangnga','0388871786','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangvuui@gmail.com',MD5('123'),'hoangvuui','0339313575','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangsuong@gmail.com',MD5('123'),'hoangsuong','0339316148','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangloan@gmail.com',MD5('123'),'hoangloan','0364395248','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangandrew@gmail.com',MD5('123'),'hoangandrew','0862312838','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangthai123@gmail.com',MD5('123'),'hoangthai123','0327831369','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangvi51@gmail.com',MD5('123'),'hoangvi51','0971381419','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangson@gmail.com',MD5('123'),'hoangson','0359841608','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangthang92@gmail.com',MD5('123'),'hoangthang92','0362362795','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangkim@gmail.com',MD5('123'),'hoangkim','0387801372','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanglien87@gmail.com',MD5('123'),'hoanglien87','0986376573','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtong@gmail.com',MD5('123'),'hoangtong','0359783519','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoanggiang@gmail.com',MD5('123'),'hoanggiang','0344832146','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtongbk@gmail.com',MD5('123'),'hoangtongbk','0861605198','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangtay@gmail.com',MD5('123'),'hoangtay','0328376054','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangmon96@gmail.com',MD5('123'),'hoangmon96','0351538272','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoangkhanh@gmail.com',MD5('123'),'hoangkhanh','0353347602','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhchi01@gmail.com',MD5('123'),'huynhchi01','0980628587','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtho@gmail.com',MD5('123'),'huynhtho','0964788112','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhhuynh@gmail.com',MD5('123'),'huynhhuynh','0983263723','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhthinh@gmail.com',MD5('123'),'huynhthinh','0969116029','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhthienxyz@gmail.com',MD5('123'),'huynhthienxyz','0975242444','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhhuong9x@gmail.com',MD5('123'),'huynhhuong9x','0346855883','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhha@gmail.com',MD5('123'),'huynhha','0388823306','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhthao@gmail.com',MD5('123'),'huynhthao','0364279964','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhngoc@gmail.com',MD5('123'),'huynhngoc','0972991867','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhnam@gmail.com',MD5('123'),'huynhnam','0343675556','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtuan97@gmail.com',MD5('123'),'huynhtuan97','0351925843','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhhong@gmail.com',MD5('123'),'huynhhong','0967856764','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhty@gmail.com',MD5('123'),'huynhty','0366940124','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhhai@gmail.com',MD5('123'),'huynhhai','0973451422','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhhau@gmail.com',MD5('123'),'huynhhau','0343992418','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtuan@gmail.com',MD5('123'),'huynhtuan','0984862312','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtinh@gmail.com',MD5('123'),'huynhtinh','0377765980','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhloc@gmail.com',MD5('123'),'huynhloc','0974151873','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhvietanh97@gmail.com',MD5('123'),'huynhvietanh97','0335011094','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtiem@gmail.com',MD5('123'),'huynhtiem','0355138644','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhthiem@gmail.com',MD5('123'),'huynhthiem','0965481989','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhnga@gmail.com',MD5('123'),'huynhnga','0387752701','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhvuui@gmail.com',MD5('123'),'huynhvuui','0320569088','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhsuong@gmail.com',MD5('123'),'huynhsuong','0381484478','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhloan@gmail.com',MD5('123'),'huynhloan','0963086968','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhandrew@gmail.com',MD5('123'),'huynhandrew','0358400420','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhthai123@gmail.com',MD5('123'),'huynhthai123','0389937550','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhvi51@gmail.com',MD5('123'),'huynhvi51','0369900368','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhson@gmail.com',MD5('123'),'huynhson','0352057781','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhthang92@gmail.com',MD5('123'),'huynhthang92','0980170404','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhkim@gmail.com',MD5('123'),'huynhkim','0976014417','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhlien87@gmail.com',MD5('123'),'huynhlien87','0961699595','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtong@gmail.com',MD5('123'),'huynhtong','0866218596','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhgiang@gmail.com',MD5('123'),'huynhgiang','0351331206','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtongbk@gmail.com',MD5('123'),'huynhtongbk','0384071984','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhtay@gmail.com',MD5('123'),'huynhtay','0989468737','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhmon96@gmail.com',MD5('123'),'huynhmon96','0353312379','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'huynhkhanh@gmail.com',MD5('123'),'huynhkhanh','0399610048','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanchi01@gmail.com',MD5('123'),'phanchi01','0336062688','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantho@gmail.com',MD5('123'),'phantho','0979802338','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanhuynh@gmail.com',MD5('123'),'phanhuynh','0979420544','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanthinh@gmail.com',MD5('123'),'phanthinh','0357554973','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanthienxyz@gmail.com',MD5('123'),'phanthienxyz','0330744651','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanhuong9x@gmail.com',MD5('123'),'phanhuong9x','0964237431','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanha@gmail.com',MD5('123'),'phanha','0379705516','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanthao@gmail.com',MD5('123'),'phanthao','0963762539','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanngoc@gmail.com',MD5('123'),'phanngoc','0345447505','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phannam@gmail.com',MD5('123'),'phannam','0335470810','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantuan97@gmail.com',MD5('123'),'phantuan97','0346660008','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanhong@gmail.com',MD5('123'),'phanhong','0396055420','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanty@gmail.com',MD5('123'),'phanty','0332710546','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanhai@gmail.com',MD5('123'),'phanhai','0394563703','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanhau@gmail.com',MD5('123'),'phanhau','0360492234','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantuan@gmail.com',MD5('123'),'phantuan','0964262831','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantinh@gmail.com',MD5('123'),'phantinh','0962255253','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanloc@gmail.com',MD5('123'),'phanloc','0331661457','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanvietanh97@gmail.com',MD5('123'),'phanvietanh97','0359884587','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantiem@gmail.com',MD5('123'),'phantiem','0362888450','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanthiem@gmail.com',MD5('123'),'phanthiem','0396817210','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phannga@gmail.com',MD5('123'),'phannga','0383672090','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanvuui@gmail.com',MD5('123'),'phanvuui','0967871270','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phansuong@gmail.com',MD5('123'),'phansuong','0331368605','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanloan@gmail.com',MD5('123'),'phanloan','0383236351','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanandrew@gmail.com',MD5('123'),'phanandrew','0864311790','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanthai123@gmail.com',MD5('123'),'phanthai123','0373500122','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanvi51@gmail.com',MD5('123'),'phanvi51','0337369544','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanson@gmail.com',MD5('123'),'phanson','0330004831','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanthang92@gmail.com',MD5('123'),'phanthang92','0365965260','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phankim@gmail.com',MD5('123'),'phankim','0860099515','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanlien87@gmail.com',MD5('123'),'phanlien87','0973796169','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantong@gmail.com',MD5('123'),'phantong','0981810538','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phangiang@gmail.com',MD5('123'),'phangiang','0979785186','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantongbk@gmail.com',MD5('123'),'phantongbk','0348999787','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phantay@gmail.com',MD5('123'),'phantay','0972160405','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phanmon96@gmail.com',MD5('123'),'phanmon96','0355341004','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phankhanh@gmail.com',MD5('123'),'phankhanh','0332654786','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuchi01@gmail.com',MD5('123'),'vuchi01','0331622195','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutho@gmail.com',MD5('123'),'vutho','0343317977','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuhuynh@gmail.com',MD5('123'),'vuhuynh','0971472138','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuthinh@gmail.com',MD5('123'),'vuthinh','0979479248','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuthienxyz@gmail.com',MD5('123'),'vuthienxyz','0394441503','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuhuong9x@gmail.com',MD5('123'),'vuhuong9x','0329136009','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuha@gmail.com',MD5('123'),'vuha','0863382222','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuthao@gmail.com',MD5('123'),'vuthao','0391621983','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vungoc@gmail.com',MD5('123'),'vungoc','0973860877','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vunam@gmail.com',MD5('123'),'vunam','0380556845','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutuan97@gmail.com',MD5('123'),'vutuan97','0322172278','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuhong@gmail.com',MD5('123'),'vuhong','0357395341','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuty@gmail.com',MD5('123'),'vuty','0863602071','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuhai@gmail.com',MD5('123'),'vuhai','0355108881','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuhau@gmail.com',MD5('123'),'vuhau','0972143959','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutuan@gmail.com',MD5('123'),'vutuan','0970162030','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutinh@gmail.com',MD5('123'),'vutinh','0321026945','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuloc@gmail.com',MD5('123'),'vuloc','0980528735','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuvietanh97@gmail.com',MD5('123'),'vuvietanh97','0350521171','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutiem@gmail.com',MD5('123'),'vutiem','0363017469','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuthiem@gmail.com',MD5('123'),'vuthiem','0977781504','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vunga@gmail.com',MD5('123'),'vunga','0383317206','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuvuui@gmail.com',MD5('123'),'vuvuui','0328472056','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vusuong@gmail.com',MD5('123'),'vusuong','0367353272','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuloan@gmail.com',MD5('123'),'vuloan','0334471683','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuandrew@gmail.com',MD5('123'),'vuandrew','0973993522','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuthai123@gmail.com',MD5('123'),'vuthai123','0866855635','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuvi51@gmail.com',MD5('123'),'vuvi51','0376532435','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuson@gmail.com',MD5('123'),'vuson','0971466658','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vuthang92@gmail.com',MD5('123'),'vuthang92','0347495149','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vukim@gmail.com',MD5('123'),'vukim','0329153562','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vulien87@gmail.com',MD5('123'),'vulien87','0369815121','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutong@gmail.com',MD5('123'),'vutong','0357701711','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vugiang@gmail.com',MD5('123'),'vugiang','0397296484','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutongbk@gmail.com',MD5('123'),'vutongbk','0971161669','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vutay@gmail.com',MD5('123'),'vutay','0977240244','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vumon96@gmail.com',MD5('123'),'vumon96','0363953408','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'vukhanh@gmail.com',MD5('123'),'vukhanh','0976631211','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamchi01@gmail.com',MD5('123'),'phamchi01','0381861758','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtho@gmail.com',MD5('123'),'phamtho','0364650204','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhuynh@gmail.com',MD5('123'),'phamhuynh','0980463973','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthinh@gmail.com',MD5('123'),'phamthinh','0353729321','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthienxyz@gmail.com',MD5('123'),'phamthienxyz','0989448023','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhuong9x@gmail.com',MD5('123'),'phamhuong9x','0963193602','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamha@gmail.com',MD5('123'),'phamha','0335234023','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthao@gmail.com',MD5('123'),'phamthao','0969193704','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamngoc@gmail.com',MD5('123'),'phamngoc','0353231222','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamnam@gmail.com',MD5('123'),'phamnam','0356312456','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtuan97@gmail.com',MD5('123'),'phamtuan97','0864194691','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhong@gmail.com',MD5('123'),'phamhong','0361678318','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamty@gmail.com',MD5('123'),'phamty','0974103891','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhai@gmail.com',MD5('123'),'phamhai','0379971126','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamhau@gmail.com',MD5('123'),'phamhau','0986459337','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtuan@gmail.com',MD5('123'),'phamtuan','0350952157','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtinh@gmail.com',MD5('123'),'phamtinh','0384796815','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamloc@gmail.com',MD5('123'),'phamloc','0372474116','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamvietanh97@gmail.com',MD5('123'),'phamvietanh97','0350912698','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtiem@gmail.com',MD5('123'),'phamtiem','0388156509','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthiem@gmail.com',MD5('123'),'phamthiem','0334252567','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamnga@gmail.com',MD5('123'),'phamnga','0351464663','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamvuui@gmail.com',MD5('123'),'phamvuui','0330130175','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamsuong@gmail.com',MD5('123'),'phamsuong','0866390761','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamloan@gmail.com',MD5('123'),'phamloan','0362156752','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamandrew@gmail.com',MD5('123'),'phamandrew','0867732091','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthai123@gmail.com',MD5('123'),'phamthai123','0343734013','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamvi51@gmail.com',MD5('123'),'phamvi51','0389385188','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamson@gmail.com',MD5('123'),'phamson','0397133699','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamthang92@gmail.com',MD5('123'),'phamthang92','0338071152','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamkim@gmail.com',MD5('123'),'phamkim','0361190900','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamlien87@gmail.com',MD5('123'),'phamlien87','0376715820','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtong@gmail.com',MD5('123'),'phamtong','0982944401','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamgiang@gmail.com',MD5('123'),'phamgiang','0349254045','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtongbk@gmail.com',MD5('123'),'phamtongbk','0322371520','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamtay@gmail.com',MD5('123'),'phamtay','0352437039','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phammon96@gmail.com',MD5('123'),'phammon96','0975110405','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'phamkhanh@gmail.com',MD5('123'),'phamkhanh','0347454700','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangchi01@gmail.com',MD5('123'),'dangchi01','0963411605','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtho@gmail.com',MD5('123'),'dangtho','0963157119','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danghuynh@gmail.com',MD5('123'),'danghuynh','0329913462','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangthinh@gmail.com',MD5('123'),'dangthinh','0399224454','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangthienxyz@gmail.com',MD5('123'),'dangthienxyz','0961782560','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danghuong9x@gmail.com',MD5('123'),'danghuong9x','0864258302','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangha@gmail.com',MD5('123'),'dangha','0391487439','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangthao@gmail.com',MD5('123'),'dangthao','0342836919','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangngoc@gmail.com',MD5('123'),'dangngoc','0330057621','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangnam@gmail.com',MD5('123'),'dangnam','0360182457','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtuan97@gmail.com',MD5('123'),'dangtuan97','0374705672','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danghong@gmail.com',MD5('123'),'danghong','0326368323','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangty@gmail.com',MD5('123'),'dangty','0370480772','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danghai@gmail.com',MD5('123'),'danghai','0974692562','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danghau@gmail.com',MD5('123'),'danghau','0975282669','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtuan@gmail.com',MD5('123'),'dangtuan','0354289474','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtinh@gmail.com',MD5('123'),'dangtinh','0355447760','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangloc@gmail.com',MD5('123'),'dangloc','0337367602','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangvietanh97@gmail.com',MD5('123'),'dangvietanh97','0867673565','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtiem@gmail.com',MD5('123'),'dangtiem','0391937700','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangthiem@gmail.com',MD5('123'),'dangthiem','0390253639','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangnga@gmail.com',MD5('123'),'dangnga','0979480163','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangvuui@gmail.com',MD5('123'),'dangvuui','0349104588','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangsuong@gmail.com',MD5('123'),'dangsuong','0986683334','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangloan@gmail.com',MD5('123'),'dangloan','0336267825','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangandrew@gmail.com',MD5('123'),'dangandrew','0375288481','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangthai123@gmail.com',MD5('123'),'dangthai123','0979108853','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangvi51@gmail.com',MD5('123'),'dangvi51','0970861495','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangson@gmail.com',MD5('123'),'dangson','0979108967','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangthang92@gmail.com',MD5('123'),'dangthang92','0334404983','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangkim@gmail.com',MD5('123'),'dangkim','0350275458','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danglien87@gmail.com',MD5('123'),'danglien87','0864090601','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtong@gmail.com',MD5('123'),'dangtong','0977697917','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'danggiang@gmail.com',MD5('123'),'danggiang','0867275628','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtongbk@gmail.com',MD5('123'),'dangtongbk','0375486721','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangtay@gmail.com',MD5('123'),'dangtay','0332130224','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangmon96@gmail.com',MD5('123'),'dangmon96','0352506863','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dangkhanh@gmail.com',MD5('123'),'dangkhanh','0329428777','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buichi01@gmail.com',MD5('123'),'buichi01','0988989534','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buitho@gmail.com',MD5('123'),'buitho','0337540092','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buihuynh@gmail.com',MD5('123'),'buihuynh','0963121096','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buithinh@gmail.com',MD5('123'),'buithinh','0860370753','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buithienxyz@gmail.com',MD5('123'),'buithienxyz','0392157923','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buihuong9x@gmail.com',MD5('123'),'buihuong9x','0328041879','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buiha@gmail.com',MD5('123'),'buiha','0983523000','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buithao@gmail.com',MD5('123'),'buithao','0359835631','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buingoc@gmail.com',MD5('123'),'buingoc','0399241735','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buinam@gmail.com',MD5('123'),'buinam','0331776662','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buituan97@gmail.com',MD5('123'),'buituan97','0328312407','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buihong@gmail.com',MD5('123'),'buihong','0330258866','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buity@gmail.com',MD5('123'),'buity','0365244963','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buihai@gmail.com',MD5('123'),'buihai','0974909465','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buihau@gmail.com',MD5('123'),'buihau','0984190459','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buituan@gmail.com',MD5('123'),'buituan','0981513655','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buitinh@gmail.com',MD5('123'),'buitinh','0988879339','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'builoc@gmail.com',MD5('123'),'builoc','0374030265','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buivietanh97@gmail.com',MD5('123'),'buivietanh97','0392882403','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buitiem@gmail.com',MD5('123'),'buitiem','0980763699','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buithiem@gmail.com',MD5('123'),'buithiem','0334449123','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buinga@gmail.com',MD5('123'),'buinga','0359725578','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buivuui@gmail.com',MD5('123'),'buivuui','0860570441','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buisuong@gmail.com',MD5('123'),'buisuong','0371510073','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'builoan@gmail.com',MD5('123'),'builoan','0374329079','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buiandrew@gmail.com',MD5('123'),'buiandrew','0372164544','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buithai123@gmail.com',MD5('123'),'buithai123','0363033515','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buivi51@gmail.com',MD5('123'),'buivi51','0359605696','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buison@gmail.com',MD5('123'),'buison','0334674607','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buithang92@gmail.com',MD5('123'),'buithang92','0348204883','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buikim@gmail.com',MD5('123'),'buikim','0378632194','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'builien87@gmail.com',MD5('123'),'builien87','0372285219','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buitong@gmail.com',MD5('123'),'buitong','0973785132','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buigiang@gmail.com',MD5('123'),'buigiang','0333446587','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buitongbk@gmail.com',MD5('123'),'buitongbk','0399022466','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buitay@gmail.com',MD5('123'),'buitay','0347023645','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buimon96@gmail.com',MD5('123'),'buimon96','0352644560','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'buikhanh@gmail.com',MD5('123'),'buikhanh','0972291149','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dochi01@gmail.com',MD5('123'),'dochi01','0391841875','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotho@gmail.com',MD5('123'),'dotho','0329847474','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dohuynh@gmail.com',MD5('123'),'dohuynh','0980894212','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dothinh@gmail.com',MD5('123'),'dothinh','0335764612','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dothienxyz@gmail.com',MD5('123'),'dothienxyz','0965069120','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dohuong9x@gmail.com',MD5('123'),'dohuong9x','0336053786','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'doha@gmail.com',MD5('123'),'doha','0390665894','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dothao@gmail.com',MD5('123'),'dothao','0394320956','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dongoc@gmail.com',MD5('123'),'dongoc','0370559481','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'donam@gmail.com',MD5('123'),'donam','0395848310','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotuan97@gmail.com',MD5('123'),'dotuan97','0984006624','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dohong@gmail.com',MD5('123'),'dohong','0972093287','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'doty@gmail.com',MD5('123'),'doty','0335096186','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dohai@gmail.com',MD5('123'),'dohai','0368227426','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dohau@gmail.com',MD5('123'),'dohau','0989329645','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotuan@gmail.com',MD5('123'),'dotuan','0338730197','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotinh@gmail.com',MD5('123'),'dotinh','0351567492','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'doloc@gmail.com',MD5('123'),'doloc','0971881847','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dovietanh97@gmail.com',MD5('123'),'dovietanh97','0960405005','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotiem@gmail.com',MD5('123'),'dotiem','0370342602','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dothiem@gmail.com',MD5('123'),'dothiem','0359677141','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'donga@gmail.com',MD5('123'),'donga','0337049767','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dovuui@gmail.com',MD5('123'),'dovuui','0372152476','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dosuong@gmail.com',MD5('123'),'dosuong','0989438823','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'doloan@gmail.com',MD5('123'),'doloan','0329086405','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'doandrew@gmail.com',MD5('123'),'doandrew','0979407040','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dothai123@gmail.com',MD5('123'),'dothai123','0966081032','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dovi51@gmail.com',MD5('123'),'dovi51','0352548190','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'doson@gmail.com',MD5('123'),'doson','0346250893','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dothang92@gmail.com',MD5('123'),'dothang92','0341699980','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dokim@gmail.com',MD5('123'),'dokim','0966290361','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dolien87@gmail.com',MD5('123'),'dolien87','0396589334','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotong@gmail.com',MD5('123'),'dotong','0971440557','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dogiang@gmail.com',MD5('123'),'dogiang','0976722655','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotongbk@gmail.com',MD5('123'),'dotongbk','0371694124','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dotay@gmail.com',MD5('123'),'dotay','0348459403','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'domon96@gmail.com',MD5('123'),'domon96','0978139137','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'dokhanh@gmail.com',MD5('123'),'dokhanh','0977921572','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hochi01@gmail.com',MD5('123'),'hochi01','0393236646','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotho@gmail.com',MD5('123'),'hotho','0335425403','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hohuynh@gmail.com',MD5('123'),'hohuynh','0972600022','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hothinh@gmail.com',MD5('123'),'hothinh','0363343446','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hothienxyz@gmail.com',MD5('123'),'hothienxyz','0352313673','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hohuong9x@gmail.com',MD5('123'),'hohuong9x','0973020209','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoha@gmail.com',MD5('123'),'hoha','0397315622','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hothao@gmail.com',MD5('123'),'hothao','0971026023','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hongoc@gmail.com',MD5('123'),'hongoc','0388206513','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'honam@gmail.com',MD5('123'),'honam','0969931631','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotuan97@gmail.com',MD5('123'),'hotuan97','0981341957','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hohong@gmail.com',MD5('123'),'hohong','0354415199','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoty@gmail.com',MD5('123'),'hoty','0989738804','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hohai@gmail.com',MD5('123'),'hohai','0328861607','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hohau@gmail.com',MD5('123'),'hohau','0343430035','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotuan@gmail.com',MD5('123'),'hotuan','0322985794','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotinh@gmail.com',MD5('123'),'hotinh','0976268330','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'holoc@gmail.com',MD5('123'),'holoc','0397144809','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hovietanh97@gmail.com',MD5('123'),'hovietanh97','0360044378','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotiem@gmail.com',MD5('123'),'hotiem','0362417644','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hothiem@gmail.com',MD5('123'),'hothiem','0971669094','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'honga@gmail.com',MD5('123'),'honga','0397660418','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hovuui@gmail.com',MD5('123'),'hovuui','0332376229','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hosuong@gmail.com',MD5('123'),'hosuong','0969065050','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'holoan@gmail.com',MD5('123'),'holoan','0979026745','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoandrew@gmail.com',MD5('123'),'hoandrew','0962446238','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hothai123@gmail.com',MD5('123'),'hothai123','0989396943','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hovi51@gmail.com',MD5('123'),'hovi51','0366183272','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hoson@gmail.com',MD5('123'),'hoson','0329099600','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hothang92@gmail.com',MD5('123'),'hothang92','0967898659','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hokim@gmail.com',MD5('123'),'hokim','0325086210','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'holien87@gmail.com',MD5('123'),'holien87','0970878631','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotong@gmail.com',MD5('123'),'hotong','0329295037','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hogiang@gmail.com',MD5('123'),'hogiang','0383824958','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotongbk@gmail.com',MD5('123'),'hotongbk','0389767822','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hotay@gmail.com',MD5('123'),'hotay','0321039689','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'homon96@gmail.com',MD5('123'),'homon96','0974344906','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'hokhanh@gmail.com',MD5('123'),'hokhanh','0341857131','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngochi01@gmail.com',MD5('123'),'ngochi01','0372944347','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotho@gmail.com',MD5('123'),'ngotho','0976583892','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngohuynh@gmail.com',MD5('123'),'ngohuynh','0349639587','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngothinh@gmail.com',MD5('123'),'ngothinh','0384753010','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngothienxyz@gmail.com',MD5('123'),'ngothienxyz','0972096555','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngohuong9x@gmail.com',MD5('123'),'ngohuong9x','0347565469','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngoha@gmail.com',MD5('123'),'ngoha','0365400495','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngothao@gmail.com',MD5('123'),'ngothao','0376495385','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngongoc@gmail.com',MD5('123'),'ngongoc','0329456439','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngonam@gmail.com',MD5('123'),'ngonam','0362972679','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotuan97@gmail.com',MD5('123'),'ngotuan97','0379774013','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngohong@gmail.com',MD5('123'),'ngohong','0986470453','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngoty@gmail.com',MD5('123'),'ngoty','0963934042','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngohai@gmail.com',MD5('123'),'ngohai','0341437535','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngohau@gmail.com',MD5('123'),'ngohau','0976508314','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotuan@gmail.com',MD5('123'),'ngotuan','0382389069','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotinh@gmail.com',MD5('123'),'ngotinh','0377925299','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngoloc@gmail.com',MD5('123'),'ngoloc','0860262952','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngovietanh97@gmail.com',MD5('123'),'ngovietanh97','0331151740','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotiem@gmail.com',MD5('123'),'ngotiem','0350130127','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngothiem@gmail.com',MD5('123'),'ngothiem','0396617476','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngonga@gmail.com',MD5('123'),'ngonga','0340049095','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngovuui@gmail.com',MD5('123'),'ngovuui','0962827961','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngosuong@gmail.com',MD5('123'),'ngosuong','0340323195','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngoloan@gmail.com',MD5('123'),'ngoloan','0344759943','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngoandrew@gmail.com',MD5('123'),'ngoandrew','0979037671','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngothai123@gmail.com',MD5('123'),'ngothai123','0358392515','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngovi51@gmail.com',MD5('123'),'ngovi51','0356829639','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngoson@gmail.com',MD5('123'),'ngoson','0971562406','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngothang92@gmail.com',MD5('123'),'ngothang92','0325690521','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngokim@gmail.com',MD5('123'),'ngokim','0366883392','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngolien87@gmail.com',MD5('123'),'ngolien87','0327005711','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotong@gmail.com',MD5('123'),'ngotong','0966027850','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngogiang@gmail.com',MD5('123'),'ngogiang','0972841248','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotongbk@gmail.com',MD5('123'),'ngotongbk','0327135837','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngotay@gmail.com',MD5('123'),'ngotay','0963224629','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngomon96@gmail.com',MD5('123'),'ngomon96','0399006986','HCM'); 
INSERT INTO users(id,email,password,fullname,phone,address) VALUES(NULL,'ngokhanh@gmail.com',MD5('123'),'ngokhanh','0333008555','HCM'); 


INSERT INTO type_product (id,name) VALUES (1,'action');
INSERT INTO type_product (id,name) VALUES (2,'advanture');
INSERT INTO type_product (id,name) VALUES (3,'casual');
INSERT INTO type_product (id,name) VALUES (4,'indie');


/* -------------------------------------------Hành Động------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Grand Theft Auto V','https://hb.imgix.net/ad3f96dfd21531e24ab72c3821a01049c8484982.jpg?auto=compress,format&fit=crop&h=353&w=616&s=9fc123b4c723d329d164b8ab02af5284',
            459,5,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/271590/Grand_Theft_Auto_V/','2013-09-17','Rockstar','YrtCnL62pB8',1);

INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Devil May Cry 5','https://steamcdn-a.akamaihd.net/steam/apps/601150/header.jpg?t=1553635207',
            800,6,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/550/Left_4_Dead_2/','2019-09-17','CAPCOM','MWxlbnI9mpU',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Tom Clancy The Devision','https://hb.imgix.net/b7768391be1f703cc59899948b552adfacdb1976.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6ba76d1681712e2258ecb34a58fefa12',
            825,7,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/365590/Tom_Clancys_The_Division/','2016-09-17','Ubisoft','uElsBflqgYw',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Watch Dogs 2','https://cdn.chip.gen.tr/images/content/2016121104062625446/watch-dogs-2-inceleme.jpg',
            800,4,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/447040/Watch_Dogs_2/','2016-09-17','Ubisoft','hh9x4NqW0Dw',1);			
/* -------------------------------------------Kinh Dị------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Outlast 2','https://images.gog.com/409993ae05dfa48caa30943b3d2f97cd0f462e0da9fca81edff85cc6a957fe3d_product_card_v2_mobile_slider_639.jpg',
            420,9,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/414700/Outlast_2/','2017-09-17','Red Barrels','QTM2655BA6U',2);
-- INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
--             VALUES (NULL,'Home Sweet Home','https://steamcdn-a.akamaihd.net/steam/apps/617160/header.jpg?t=1544779603',
--             371,94,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
--             'https://store.steampowered.com/app/617160/Home_Sweet_Home/','2017-09-17','YGGDRAZIL GROUP','R-vYl7grT5Q',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Resident Evil 7 ','https://cdn.cdkeys.com/500x706/media/catalog/product/r/e/resident_evil_7_-_biohazard_cover.jpg',
            900,12,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/418370/RESIDENT_EVIL_7_biohazard__BIOHAZARD_7_resident_evil/','2017-09-17','CAPCOM','W1OUs3HwIuo',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Resident Evil 2 Remake','https://genknews.genkcdn.vn/2019/3/4/1-1551670114758393408513.jpg',
            1100,11,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/883710/RESIDENT_EVIL_2__BIOHAZARD_RE2/','2019-09-17','CAPCOM','u3wS-Q2KBpk',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Little Nightmares','https://hb.imgix.net/7053ec649ae54173f01ce24015a00976a4f958d6.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6ff070f396d7f472d94d27d2692a308f',
            240,8,'vncur 550 idcur','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/424840/Little_Nightmares/','2017-09-17','BANDAI','aOadxZBsPiA',2);			
/* -------------------------------------------Thể Thao------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Rocket League','https://steamcdn-a.akamaihd.net/steam/apps/252950/header.jpg?t=1553116050',
            256,21,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/252950/Rocket_League/','2015-02-28','Psyonix',"Vawwy2eu5sA",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'WWE 2K18','https://steamcdn-a.akamaihd.net/steam/apps/664430/header.jpg?t=1534550792',
            300,10,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/664430/WWE_2K18/','2017-02-28','Visual Concepts',"7ZbZfsuLXtg",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Beat Saber','https://steamcdn-a.akamaihd.net/steam/apps/620980/header.jpg?t=1543281439',
            800,14,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/620980/Beat_Saber/','2018-02-28','Beat Games',"pa4vrynwkwY",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'NBA 2k17','https://steamcdn-a.akamaihd.net/steam/apps/385760/header.jpg?t=1542134244',
            320,16,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/385760/NBA_2K17/','2016-02-28','Visual Concepts',"cQKDcMxTAfw",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'WRC 7 FIA World Rally Championship','https://steamcdn-a.akamaihd.net/steam/apps/621830/header.jpg?t=1538038559',
            400,8,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/621830/WRC_7_FIA_World_Rally_Championship/','2017-02-28','KT Racing',"sjoEGhY89Q",3);			
/* -------------------------------------------Nhập Vai------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Elder Scrolls V: Skyrim','https://steamcdn-a.akamaihd.net/steam/apps/489830/header.jpg?t=1533676854',
            300,3,'vncur 644','​Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/','2016-02-28','Bethesda Game Studios',"JSRtYpNRoN0",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Witcher 3: Wild Hunt','https://steamcdn-a.akamaihd.net/steam/apps/292030/header.jpg?t=1550078557',
            400,4,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/292030/The_Witcher_3_Wild_Hunt/','2015-02-28','CD PROJEKT RED',"ehjJ614QfeM",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Sekiro: Shadows Die Twice','https://steamcdn-a.akamaihd.net/steam/apps/814380/header.jpg?t=1553906171',
            1200,23,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice/','2019-02-28','Activision',"aUnEezrBFoA",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Dark Souls 3','https://steamcdn-a.akamaihd.net/steam/apps/374320/header.jpg?t=1553251330',
            800,7,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/374320/DARK_SOULS_III/','2016-02-28','
            FromSoftware',"zDZYrIUgKE",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Diablo 3','https://images.g2a.com/newlayout/600x351/1x1x0/f4440f6cc460/5a141651ae653a29cc660b5e',
            800,14,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://us.diablo3.com/en/','2013-02-28','Blizzard Entertainment ',"NWa41eJjr0c",4);			
/* -------------------------------------------Đối Kháng------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Mortal Kombat X','https://steamcdn-a.akamaihd.net/steam/apps/307780/header.jpg?t=1551909865',
            900,25,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/307780/Mortal_Kombat_X/','2015-02-28','NetherRealm Studios',"jSi2LDkyKmI",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Injustice: Gods Among Us Ultimate Edition','https://steamcdn-a.akamaihd.net/steam/apps/242700/header.jpg?t=1545176902',
            800,4,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay! ','https://store.steampowered.com/app/242700/Injustice_Gods_Among_Us_Ultimate_Edition/','2013-02-28','NetherRealm Studios',"hMkTQSbE6Bc",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Street Fighter V','https://steamcdn-a.akamaihd.net/steam/apps/310950/header.jpg?t=1553630183',
            200,12,'vncur 644','',
            'https://store.steampowered.com/app/310950/Street_Fighter_V/','2016-02-28','Capcom',"0nFd7Iylj5A",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'JUMP FORCE','https://steamcdn-a.akamaihd.net/steam/apps/816020/header.jpg?t=1553188281',
            1100,16,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/816020/JUMP_FORCE/','2019-02-28','BANDAI NAMCO Entertainment',"7U50iYupwBE",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'NARUTO SHIPPUDEN: Ultimate Ninja STORM Revolution','https://steamcdn-a.akamaihd.net/steam/apps/272510/header.jpg?t=1447360052',
            400,31,'vncur 644','Home Sweet Home is a first-person horror adventure game based on Thai myths and beliefs.   The core gameplay focuses on storytelling and stealth to avoid perilous spirits hunting you. Moreover, few puzzles are added into the game, making gameplay more various. While playing this game, you will be thrilled by a horror Thai atmosphere, unpredictable scary moments and challenging gameplay!',
            'https://store.steampowered.com/app/272510/NARUTO_SHIPPUDEN_Ultimate_Ninja_STORM_Revolution/','2014-02-28','BANDAI NAMCO Entertainment',"1NKBruhXn-8",4);			



INSERT INTO orders(id,user_id) VALUES(null,1);
INSERT INTO orders(id,user_id) VALUES(null,2);
INSERT INTO orders(id,user_id) VALUES(null,3);
INSERT INTO orders(id,user_id) VALUES(null,4);
INSERT INTO orders(id,user_id) VALUES(null,5);



INSERT INTO orderitems(order_id,product_id,quantity) VALUES (1,1,2);
INSERT INTO orderitems(order_id,product_id,quantity) VALUES (2,2,2);
INSERT INTO orderitems(order_id,product_id,quantity) VALUES (3,3,3);
INSERT INTO orderitems(order_id,product_id,quantity) VALUES (4,4,2);
INSERT INTO orderitems(order_id,product_id,quantity) VALUES (5,5,4);


