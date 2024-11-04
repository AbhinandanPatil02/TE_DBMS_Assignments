

CREATE TABLE borrower(
    roll_no INT PRIMARY KEY,
    name VARCHAR(30),
    book_name VARCHAR(30),
    date_of_issue DATE,
    status VARCHAR(30)
);


INSERT INTO borrower VALUES (1,"abhi1","book_1","2024-10-17","Issued");
INSERT INTO borrower VALUES (2,"abhi2","book_2","2024-10-27","Issued");
INSERT INTO borrower VALUES (3,"abhi3","book_3","2024-10-20","Issued");
INSERT INTO borrower VALUES (4,"abhi4","book_4","2024-10-01","Issued");
INSERT INTO borrower VALUES (5,"abhi5","book_5","2023-10-01","Issued");


CREATE TABLE fine(
    roll_no INT ,
    book_name varchar(30),
    date_of_return DATE,
    no_of_days INT,
    amt INT,
    FOREIGN KEY (roll_no) REFERENCES borrower(roll_no) ON DELETE CASCADE
);




DELIMITER &&
CREATE OR REPLACE PROCEDURE calfine(IN roll_no INT)
BEGIN 
DECLARE book_name VARCHAR(30);
DECLARE date_of_issue DATE;
DECLARE days INT ;
DECLARE amt INT DEFAULT 0;
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ="Invalid Roll no or other s .............";    
ROLLBACK ;
END;
IF roll_no <0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ="Invalid Roll no";
END IF;
SELECT b.book_name,b.date_of_issue INTO book_name,date_of_issue FROM borrower b WHERE b.roll_no=roll_no;
set days= DATEDIFF(CURDATE(),date_of_issue);
if days>=15 AND days <=30 THEN 
    SET amt = 5*days;
ELSEIF days>30 THEN
    SET amt =50*days;
END IF;
UPDATE borrower  b SET status = "Returned" WHERE b.roll_no=roll_no ;
IF amt >0 THEN
    INSERT INTO fine VALUES (roll_no,book_name,CURDATE(),days,amt);
END IF;
END &&
DELIMITER ;





CREATE TABLE student(
    roll int primary key,
    name varchar(30),
    bookname VARCHAR(30),
    date_of_issue DATE,
    status VARCHAR(30)
);


INSERT INTO student VALUES (1,"abhi1","book_1","2024-10-17","Issued");
INSERT INTO student VALUES (2,"abhi2","book_2","2024-10-27","Issued");
INSERT INTO student VALUES (3,"abhi3","book_3","2024-10-20","Issued");
INSERT INTO student VALUES (4,"abhi4","book_4","2024-10-01","Issued");
INSERT INTO student VALUES (5,"abhi5","book_5","2023-10-01","Issued");

create table fine(
    roll int ,
    date_of_return DATE,
    days INT,
    amt INT,
    foreign key (roll) references student(roll) on delete cascade
);

DELIMITER &&
CREATE OR REPLACE PROCEDURE fincal(IN roll INT)
BEGIN
DECLARE date_of_issue DATE;
DECLARE days INT;
DECLARE amt int default 0;
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
SIGNAL SQLSTATE '45000' set MESSAGE_TEXT ="Invalid roll no ";
ROLLBACK;
END;
IF roll<0 THEN
    SIGNAL SQLSTATE '45000' set MESSAGE_TEXT="Invalid rollno ";
END IF;
SELECT s.date_of_issue INTO date_of_issue FROM student s WHERE s.roll=roll;
set days=DATEDIFF(CURDATE(),date_of_issue);
if days >15 AND days<=30 THEN 
    set amt=days*5;
ELSEIF days>30 THEN
    set amt=days*50;
END IF;
UPDATE student s SET status = "Returned" WHERE s.roll=roll;
if amt>0 THEN
    INSERT INTO FINE VALUES(roll,CURDATE(),days,amt);
END IF;
END &&
DELIMITER ;


















