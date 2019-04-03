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
            459,300,'vncur 550 idcur','Tựa game nổi tiếng Grand Theft Auto hay còn gọi là GTA, phiên bản mới nhất hiện tại là gta 5 với cấu hình vừa phải nhưng đồ họa bắt mắt, thể loại game nhập vai thế giới mở đưa người chơi vào 1 thế giới như đời thực được đắm mình trong những bãi biến quán bar hay nhưng thú vui tennis đua xe, nhà cửa mọi thứ đều có thể là của bạn.',
            'https://store.steampowered.com/app/271590/Grand_Theft_Auto_V/','2013-09-17','Rockstar','YrtCnL62pB8',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Sleeping Dogs','https://images.g2a.com/newlayout/323x433/1x1x0/496cb3355174/590e5046ae653af70d168b89',
            625,94,'vncur 550 idcur','Trong Sleeping Dogs, bạn sẽ vào vai Wei Shen – một cảnh sát ngầm người Mỹ gốc Á. Trở lại Hồng Kông sau nhiều năm sinh sống tại Mỹ, Wei Shen được cảnh sát Hồng Kông giao nhiệm vụ thâm nhập vào Sun On Yee – một hội Tam Hoàng khét tiếng tại Hồng Kông. Wei Shen đã nỗ lực để được chú ý tới và leo dần lên các vị trí cao hơn trong hội, đồng thời thu thập các tin tức quan trọng nhằm cung cấp cho cảnh sát mà không để bị lộ thân phận.',
            'https://store.steampowered.com/app/307690/Sleeping_Dogs_Definitive_Edition/','2014-09-17','United Front Games','lbGs8AJyT_Y',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Devil May Cry 5','https://steamcdn-a.akamaihd.net/steam/apps/601150/header.jpg?t=1553635207',
            800,795,'vncur 550 idcur','Trong Devil May Cry 5, điều lạ lùng đã xảy đến. Lần đầu tiên trong dòng game, Dante bị đả bại ngay trong chính khởi đầu của trò chơi, và điều đó nói lên được nhiều thứ hơn là cho thấy sức mạnh của ác nhân chính Urizen trong game. Gã thợ săn quỷ giờ đây già dặn hơn xưa, có phần… khiêm nhường hơn xưa, và để lại phần bày tỏ cảm xúc dành cho lớp trẻ. Nero giờ đây phản chiếu khá rõ tính cách của Dante thời trẻ với mong muốn thể hiện bản thân tối đa, đặc biệt sau khi cánh tay quỷ Devil Bringer/Yamato bị cướp đi. Trong khi đó, gương mặt mới V sở hữu những dòng thoại được viết đầy tỉ mỉ, trích dẫn thơ của William Blake như một lời ẩn ý về sự xung đột cực điểm giữa những dòng máu chung cội nguồn. Ngoài ra, hãy để ý đến thái độ của V trong mỗi lần Nero được nhắc đến, có thể bạn sẽ nhận ra danh tính thật sự của V trước khi game hé mở đấy!',
            'https://store.steampowered.com/app/550/Left_4_Dead_2/','2019-09-17','CAPCOM','MWxlbnI9mpU',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Tom Clancy The Devision','https://hb.imgix.net/b7768391be1f703cc59899948b552adfacdb1976.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6ba76d1681712e2258ecb34a58fefa12',
            825,605,'vncur 550 idcur','Một tập đoàn khủng bố chưa biết tên đã thí nghiệm thành công một loại Virus sinh sôi ngay trên những tờ tiền chúng ta đang cầm trên tay hàng ngày. Đó là vật ngang giá chung cũng như trở thành mục đích sống của mọi người.
 Và “Ngày Thứ 6 Đen Tối” diễn ra, hàng triệu người cùng nhau đi mua sắm, Virus được dịp lan rộng để rồi sau vài ngày sau cả nước Mĩ chìm vào khủng hoảng. Khủng hoảng ở đây là về mặt con người khi cảnh xung đột diễn ra, lực lượng cảnh sát tê liệt, hàng trăm vụ bạo động nhấn những con đường tấp nập chìm vào hỗn loạn. Tất cả kết lại bằng câu nói của viên cảnh sát: “chúng tôi không được huấn luyện cho tình huống này!”. Bối cảnh loạn lạc ắt sẽ xuất hiện nhân tài, không ai khác đó là người chơi. Nhưng, tạm gạt qua một bên cái danh Agent hay tổ chức The Division đi, vì sao? Vì bạn chỉ là một kẻ sống sót sau cơn khủng hoảng, gia nhập vào lực lượng gần như là duy nhất. Điều bạn cần làm không phải để gắn lên áo hàng đống quân hàm, huy chương mà là chiến đấu để mang lại những điều tốt đẹp còn sót lại cho New York. Tất cả chỉ có như vậy!',
            'https://store.steampowered.com/app/365590/Tom_Clancys_The_Division/','2016-09-17','Ubisoft','uElsBflqgYw',1);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Watch Dogs 2','https://cdn.chip.gen.tr/images/content/2016121104062625446/watch-dogs-2-inceleme.jpg',
            800,420,'vncur 550 idcur','Ngôi sao chính của Watch Dogs 2, Marcus Holloway là một hacker trẻ tài năng. Một nhân vật mạnh mẽ, cuốn hút, một chút điên rồ pha chút vui nhộn; có thể nói, anh ta đã có mọi thứ mà Aiden Pearce (nhân vật chính của Watch Dogs) không có được.',
            'https://store.steampowered.com/app/447040/Watch_Dogs_2/','2016-09-17','Ubisoft','hh9x4NqW0Dw',1);			
/* -------------------------------------------Kinh Dị------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Outlast 2','https://images.gog.com/409993ae05dfa48caa30943b3d2f97cd0f462e0da9fca81edff85cc6a957fe3d_product_card_v2_mobile_slider_639.jpg',
            420,320,'vncur 550 idcur','Outlast 2 diễn ra cùng thế giới và sau sự kiện đẫm máu tại Mount Massive Asylum (Outlast đầu tiên). Tuy nhiên, phần 2 này lấy bối cảnh tại một khu làng mang tên Temple Gate cách biệt với thế giới bên ngoài, chính xác hơn là nằm tại một vùng hẻo lảnh trong những hẻm núi của hoang mạc Arizona. Blake Langermann - người quay phim cùng vợ mình là Lynn - một nữ phóng viên chuyên nghiệp, đã đích thân đến khu vực này để điều tra về vụ giết người. Nạn nhân là Jane Doe, cô được tìm thấy ở bên đường cao tốc khi đang mang thai 8 tháng, sau đó được tìm thấy "tự siết cổ mình đến chết" ngay tại bệnh viện mà cô được đưa vào - theo lời khai của cảnh sát.',
            'https://store.steampowered.com/app/414700/Outlast_2/','2017-09-17','Red Barrels','QTM2655BA6U',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Home Sweet Home','https://steamcdn-a.akamaihd.net/steam/apps/617160/header.jpg?t=1544779603',
            371,94,'vncur 550 idcur','Home Sweet Home là một câu chuyện ly kỳ độc đáo, cùng thiết kế game mang đến cảm giác tươi mới cho fan của thể loại kinh dị. Ở khía cạnh trải nghiệm, dường như nhà phát triển rất biết cách tạo nên một tựa game kinh dị hấp dẫn. Trò chơi không chỉ có ma và những màn hù dọa thường thấy, nó còn được thiết kế khá hài hòa pha trộn nhiều lối chơi khác nhau. Xoay quanh việc làm sao để sinh tồn, người chơi phải hành động lén lút đúng nghĩa, hay chơi trốn tìm khi bị ma dí và tất nhiên không thể thiếu một số màn giải đố để tăng thêm kịch tính.',
            'https://store.steampowered.com/app/617160/Home_Sweet_Home/','2017-09-17','YGGDRAZIL GROUP','R-vYl7grT5Q',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Resident Evil 7 ','https://cdn.cdkeys.com/500x706/media/catalog/product/r/e/resident_evil_7_-_biohazard_cover.jpg',
            900,700,'vncur 550 idcur','Resident Evil 7: Biohazard là phiên bản mới nhất trong series game kinh dị dài kỳ của Capcom. Khoảng thời gian này, người chơi sẽ dấn thân vào khu điền trang nhà Baker, nằm gần một nhánh sông âm u đen tối để tìm kiếm người vợ đã mất tích của mình. ',
            'https://store.steampowered.com/app/418370/RESIDENT_EVIL_7_biohazard__BIOHAZARD_7_resident_evil/','2017-09-17','CAPCOM','W1OUs3HwIuo',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Resident Evil 2 Remake','https://genknews.genkcdn.vn/2019/3/4/1-1551670114758393408513.jpg',
            1100,900,'vncur 550 idcur','Có rất nhiều thứ đáng để thích trong phiên bản Resident Evil 2 Remake, từ cái sự đẫm máu không khoan nhượng cho tới sự đa dạng về trải nghiệm được gói gọn trong tựa game. Nhìn lại đống hoang tàn người viết đã gây ra trong suốt chiều dài game, cảm xúc là rất khó diễn tả. Đó là một trải nghiệm tuyệt vời. nhưng đồng thời cũng có cảm giác gì đó không đúng. Bắt kịp thời đại bằng cách chuyển đổi góc nhìn camera và cách di chuyển giảm đi độ khó của bản gốc, và việc không có những diễn viên cũ quay trở lại để nối game với phần còn lại của thương hiệu là khá đáng tiếc. Resident Evil 2 phần nhiều rất xuất sắc, nhưng đôi khi nó gặp khó khăn trong việc xuất sắc hóa tổng thể đó.',
            'https://store.steampowered.com/app/883710/RESIDENT_EVIL_2__BIOHAZARD_RE2/','2019-09-17','CAPCOM','u3wS-Q2KBpk',2);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Little Nightmares','https://hb.imgix.net/7053ec649ae54173f01ce24015a00976a4f958d6.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6ff070f396d7f472d94d27d2692a308f',
            240,110,'vncur 550 idcur','Thay vì sử dụng cách giới thiệu cốt truyện qua các mẫu gợi ý nhỏ rải rác khắp game và các mối quan hệ phức tạp giữa các nhân vật, Little Nightmares đặc biệt xuất sắc trong việc đưa trải nghiệm cốt truyện cho game thủ qua từng chi tiết hình ảnh và gameplay rùng rợn, trau chuốt kĩ lưỡng. Hình ảnh và trải nghiệm kinh dị đúng chất sẽ luôn để lại ấn tượng sâu sắc nhất.',
            'https://store.steampowered.com/app/424840/Little_Nightmares/','2017-09-17','BANDAI','aOadxZBsPiA',2);			
/* -------------------------------------------Thể Thao------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Rocket League','https://steamcdn-a.akamaihd.net/steam/apps/252950/header.jpg?t=1553116050',
            256,120,'vncur 644','Kể từ khi tựa game Rocket League ra mắt vào đầu tháng 7 cho đến nay, trò chơi đã nhận được rất nhiều sự khen ngợi từ các trang tin uy tín và cộng động game thủ. Với lối chơi là sự kết hợp độc đáo giữa đua xe và đá bóng, Rocket League mang đến cho bạn những trận cầu đầy kịch tính với các pha ghi bàn khó tin và niềm phấn khích tột độ cho cả người xem lẫn người chơi. ',
            'https://store.steampowered.com/app/252950/Rocket_League/','2015-02-28','Psyonix',"Vawwy2eu5sA",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'WWE 2K18','https://steamcdn-a.akamaihd.net/steam/apps/664430/header.jpg?t=1534550792',
            300,150,'vncur 644','với 43 ngôi sao của WWE được xác nhân sẽ có mặt trong game. Buổi công bố được dẫn bởi đô vật WWE chuyên nghiệp Kevin Owens, cùng hai bình luận viên Renee Young và Corey Graves. 
WWE 2K18 là tựa game thứ 9 trong dòng game đầu vật chuyên nghiệp WWE nổi tiếng. Game sẽ có cách chơi tương tự như các phiên bản WWE trước, trừ một số thay đổi nhỏ về số đô vật hay cơ chế. Điều mới mẻ nhất trong WWE 2k18 có lẽ là hệ thống mang vác, cho phép người chơi mang đối thủ của mình và đặt xuống một điểm nhất định.',
            'https://store.steampowered.com/app/664430/WWE_2K18/','2017-02-28','Visual Concepts',"7ZbZfsuLXtg",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Beat Saber','https://steamcdn-a.akamaihd.net/steam/apps/620980/header.jpg?t=1543281439',
            800,780,'vncur 644','Beat Saber là một trò chơi nhịp điệu thực tế ảo 2018 được tạo ra bởi studio độc lập Beat Games (trước đây có tên Hyperbolic Magnetism), trong đó người chơi chém các khối đại diện cho nhịp đập âm nhạc với một cặp lưỡi kiếm năng lượng giống như thanh kiếm ánh sáng',
            'https://store.steampowered.com/app/620980/Beat_Saber/','2018-02-28','Beat Games',"pa4vrynwkwY",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'NBA 2k17','https://steamcdn-a.akamaihd.net/steam/apps/385760/header.jpg?t=1542134244',
            320,120,'vncur 644','Phiên bản NBA 2K17 thứ nhất được hé lộ mang tên Legend Edition, đúng như tên gọi phiên bản này sẽ được mang hình ảnh huyền thoại bóng rổ Kobe Bryant trên vỏ bìa lẫn nội dung bên trong.
 Còn với phiên bản tiêu chuẩn còn lại, ngôi sao sẽ có mặt trên bìa của nó vẫn còn là ẩn số và sẽ chỉ được tiết lộ sau giải vô địch NBA 2K16 Road to the Finals vào tháng 6.',
            'https://store.steampowered.com/app/385760/NBA_2K17/','2016-02-28','Visual Concepts',"cQKDcMxTAfw",3);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'WRC 7 FIA World Rally Championship','https://steamcdn-a.akamaihd.net/steam/apps/621830/header.jpg?t=1538038559',
            400,220,'vncur 644','WRC 7 sẽ mang đến những chiếc xe cũng như tuyển thủ chính thức của giải đua xe địa hình World Rally Championship 2017. Cùng với đó là 52 đường đua trải dài qua 13 quốc gia, hứa hẹn đem đến những thử thách khắc nghiệt nhất cho các fan của game đua xe địa hình.',
            'https://store.steampowered.com/app/621830/WRC_7_FIA_World_Rally_Championship/','2017-02-28','KT Racing',"sjoEGhY89Q",3);			
/* -------------------------------------------Nhập Vai------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Elder Scrolls V: Skyrim','https://steamcdn-a.akamaihd.net/steam/apps/489830/header.jpg?t=1533676854',
            300,120,'vncur 644','​Trong trò chơi bạn sẽ vào vai một nhân vật anh hùng diệt con rồng mà được cho rằng nó sẽ hủy diệt trái đất. Bạn sẽ xây dựng nhân vật của mình, nâng cao sức mạnh kỹ năng để đi đến đích cuối cùng. Trong game có nhũng NPC sẽ hỗ trợ cho bạn, giao nhiệm vụ hay thậm chí là chiến đấu cùng bạn.',
            'https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/','2016-02-28','Bethesda Game Studios',"JSRtYpNRoN0",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'The Witcher 3: Wild Hunt','https://steamcdn-a.akamaihd.net/steam/apps/292030/header.jpg?t=1550078557',
            400,300,'vncur 644','là “dấu chốt” cuối cùng cho cuộc phiêu lưu của Geralt – ra mắt những ngày gần đây mang tên The Witcher 3: Wild Hunt đã làm cho cộng đồng game phải “điên đảo” với nền tảng đồ họa tuyệt mỹ, lối chơi đa dạng và có chiều sâu, cùng một cốt truyện gợi mở “thật tuyệt vời!”',
            'https://store.steampowered.com/app/292030/The_Witcher_3_Wild_Hunt/','2015-02-28','CD PROJEKT RED',"ehjJ614QfeM",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Sekiro: Shadows Die Twice','https://steamcdn-a.akamaihd.net/steam/apps/814380/header.jpg?t=1553906171',
            1200,1100,'vncur 644','Sekiro lấy bối cảnh cuối thế kỷ XVI ở Nhật Bản, giai đoạn Sengoku Jidai khi các lãnh chúa tranh giành quyền lực. Nhân vật chính là một shinobi với nhiệm vụ bảo vệ thiếu chủ của gia tộc mình phục vụ. Game nói về hành trình đi cứu lại thiếu chủ sau khi cậu bị bắt cóc bởi gia tộc Ashina, nhân vật chính bị thương và bị chặt đứt một tay. Sau khi tỉnh dậy, anh thấy cánh tay trái bị chặt mất giờ đã được thay bằng cánh tay máy – Prosthetic Arm. Anh được gọi là SEKIRO – “Sói một tay”, và hành trình bắt đầu.',
            'https://store.steampowered.com/app/814380/Sekiro_Shadows_Die_Twice/','2019-02-28','Activision',"aUnEezrBFoA",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Dark Souls 3','https://steamcdn-a.akamaihd.net/steam/apps/374320/header.jpg?t=1553251330',
            800,620,'vncur 644','Dark Souls 3 xứng danh là tuyệt phẩm của năm 2016 ở âm thanh và lối chơi. Trong khi vẫn giữ được tôn chỉ về độ khó và cốt truyện bí hiểm của dòng game Souls',
            'https://store.steampowered.com/app/374320/DARK_SOULS_III/','2016-02-28','
FromSoftware',"zDZYrIUgKE",4);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'https://us.diablo3.com/en/','https://images.g2a.com/newlayout/600x351/1x1x0/f4440f6cc460/5a141651ae653a29cc660b5e',
            800,720,'vncur 644','Cốt truyện Diablo 3 tiếp diễn sang chương 3 với việc Azmodan hé lộ nơi xuất quân của mình là đỉnh Arreat. Đợt tấn công tổng lực này sẽ là đòn cuối cùng được tung ra và quân địa ngục sẽ tràn ngập Thánh Vực, Azmodan sẽ là chúa tể địa ngục nếu chiếm được viên Black Soulstone.',
            'https://us.diablo3.com/en/','2013-02-28','Blizzard Entertainment ',"NWa41eJjr0c",4);			
/* -------------------------------------------Đối Kháng------------------------------------------------- */
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Mortal Kombat X','https://steamcdn-a.akamaihd.net/steam/apps/307780/header.jpg?t=1551909865',
            900,720,'vncur 644','Mortal Kombat XL là một tượng đài dành riêng cho những người thích cảm giác mạnh. Còn gì đáng chán hơn khi một tên siêu ác nhân tung hết sự hoa mỹ của mình mà chỉ “đẩy ngã” kẻ thù. Đến Disney còn có thể làm kịch tính hơn. Đánh nhau ở đây không phải là màn múa may hoa mỹ như các cháu thiếu nhi tập văn nghệ, mà thuần là sức mạnh, với tất cả sự cục mịch gai góc của nó.',
            'https://store.steampowered.com/app/307780/Mortal_Kombat_X/','2015-02-28','NetherRealm Studios',"jSi2LDkyKmI",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Injustice: Gods Among Us Ultimate Edition','https://steamcdn-a.akamaihd.net/steam/apps/242700/header.jpg?t=1545176902',
            800,520,'vncur 644','Nếu là một fan hâm mộ siêu anh hùng truyện tranh có lẽ bạn không còn xa lạ với những cái tên như Superman, Batman hay Wonder Woman - các đại diện tiêu biểu cho cả một đế chế DC Comics huyền thoại. Nay tất cả những hình tượng đó sẽ sống lại trong Injustice: Gods Among Us, tựa game đối kháng do hãng phát triển nổi tiếng NetherRealm nhào nặn. Game lấy bối cảnh không xa trong thế giới DC Comics nơi Superman rơi vào mưu đồ của Joker, vô tình hạ sát Lois Lane cùng đứa con chưa chào đời. Không những vậy, vị anh hùng này còn gián tiếp dẫn tới sự hủy diệt của cả thành phố Metropolis và hàng triệu dân cư.','https://store.steampowered.com/app/242700/Injustice_Gods_Among_Us_Ultimate_Edition/','2013-02-28','NetherRealm Studios',"hMkTQSbE6Bc",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'Street Fighter V','https://steamcdn-a.akamaihd.net/steam/apps/310950/header.jpg?t=1553630183',
            200,90,'vncur 644','',
            'https://store.steampowered.com/app/310950/Street_Fighter_V/','2016-02-28','Capcom',"0nFd7Iylj5A",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'JUMP FORCE','https://steamcdn-a.akamaihd.net/steam/apps/816020/header.jpg?t=1553188281',
            1100,920,'vncur 644','Nhằm ngăn ngừa thảm họa diệt vong, một nhóm anh hùng mới có tên Jump Force đã được thành lập bởi Director Glover. Với sự tham gia của các chiến binh mạnh nhất từ khắp vũ trụ manga/anime nổi tiếng, người chơi sẽ có thể trải nghiệm cảm giác chiến đấu bên cạnh (hoặc đối đầu) những nhân vật yêu thích.',
            'https://store.steampowered.com/app/816020/JUMP_FORCE/','2019-02-28','BANDAI NAMCO Entertainment',"7U50iYupwBE",5);
INSERT INTO products (id,name,image,priceold,pricenew,code,description,link_origin,date_release,developer,link_trailer,type_product_id)
            VALUES (NULL,'NARUTO SHIPPUDEN: Ultimate Ninja STORM Revolution','https://steamcdn-a.akamaihd.net/steam/apps/272510/header.jpg?t=1447360052',
            400,120,'vncur 644','Phiên bản lần này sẽ mang tới số lượng nhân vật lớn nhất từ trước đến nay: 100 so với 80 ở bản Full Burst gần đây, và những nhân vật mới này sẽ đều do chính tay họa sĩ Masashi Kishimoto - tác giả bộ truyện Naruto chắp bút. Một tính năng khác mang tên Combination Secret Technique Attack cũng được giới thiệu, cho phép người chơi kết hợp tuyệt chiêu của các Ninja lại với nhau tạo ra đòn thế uy lực hơn.',
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

