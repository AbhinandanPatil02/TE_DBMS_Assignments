

CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(30),
    marks INT DEFAULT 0
);
CREATE TABLE result (
    roll_no INT PRIMARY KEY,
    name VARCHAR(30),
    marks INT DEFAULT 0,
    class VARCHAR(30)
);


INSERT INTO student VALUES (1,"Abhi",1456);
INSERT INTO student VALUES (2,"Sahil",900);
INSERT INTO student VALUES (3,"Manav",786);
INSERT INTO student VALUES (4,"Aniruddha",892);

DELIMITER &&
CREATE OR REPLACE FUNCTION detclass(marks INT)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
DECLARE class VARCHAR (30);
IF marks>=900 AND marks <=1500 THEN 
    set class ="Destinction";
ELSEIF marks>=800 AND marks<=899 THEN 
    set class ="First Class";
ELSEIF marks >=825 AND marks <=799 THEN
    set class ="Higher Second Class";
ELSE 
    set class="Not classified";
END IF;
RETURN class;
END &&
DELIMITER ;


DELIMITER &&
CREATE OR REPLACE procedure classdet(IN roll_no INT)
BEGIN 
DECLARE name VARCHAR(30) ;
DECLARE marks INT;
DECLARE class VARCHAR(30);

SELECT s.name ,s.marks INTO name,marks from student as s WHERE s.roll_no=roll_no;
SET class =detclass(marks);
INSERT INTO result VALUES(roll_no,name,marks,class);
END &&







