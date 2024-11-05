CREATE TABLE lib(
    book_id INT PRIMARY KEY,
    book_name VARCHAR(30),
    author VARCHAR(30),
    publish_year INT
);


create table libaudit(
    book_id INT PRIMARY KEY,
    book_name VARCHAR(30),
    author VARCHAR(30),
    publish_year INT,
    operation VARCHAR(30)
);




INSERT INTO lib values(1,"Book_1","Auth_1",1960);
INSERT INTO lib values(2,"Book_2","Auth_2",2003);
INSERT INTO lib values(3,"Book_3","Auth_3",2005);
INSERT INTO lib values(4,"Book_4","Auth_4",1970);
INSERT INTO lib values(5,"Book_5","Auth_5",1980);


DELIMITER $$
CREATE or replace TRIGGER before_delete_lib
before delete on lib
FOR EACH ROW
BEGIN
INSERT INTO libaudit VALUES (OLD.book_id,OLD.book_name,OLD.author,OLD.publish_year,"Delete");
END $$
DELIMITER ;

DELIMITER &&
CREATE OR REPLACE TRIGGER before_update_lib
before update on lib
for each ROW
BEGIN
INSERT INTO libaudit VALUES (OLD.book_id,OLD.book_name,OLD.author,OLD.publish_year,"Update");
END &&
DELIMITER ;


DELIMITER &&
CREATE OR REPLACE TRIGGER after_insert_lib
AFTER INSERT on lib
for each ROW
BEGIN
INSERT INTO libaudit VALUES (NEW.book_id,NEW.book_name,NEW.author,NEW.publish_year,"INSERT");
END &&
DELIMITER ;






