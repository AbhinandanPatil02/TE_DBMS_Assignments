

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


CREATE TABLE fine(
    roll_no INT PRIMARY KEY,
    date_of_return DATE,
    days INT,
    amt INT
);


DELIMITER &&
CREATE OR REPLACE PROCEDURE calfine(IN roll INT)
BEGIN 
DECLARE date_of_issue DATE;
DECLARE days INT;
DECLARE amt INT DEFAULT 0;
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ="INVALID roll_no or error occurs";
    ROLLBACK;
END;
IF roll<0 THEN
    SIGNAL SQLSTATE '45000' set MESSAGE_TEXT="INvalid Roll_no";
END IF;
SELECT b.date_of_issue INTO date_of_issue FROM borrower b WHERE b.roll_no=roll;
SET days = DATEDIFF(CURDATE(),date_of_issue);
if days>15 AND days <=30 THEN 
    set amt=5*(days-15);
ELSEIF days>30 THEN
    set amt=50*(days-30)+75;
END IF;
UPDATE borrower SET status ="Returned" WHERE roll_no=roll;
IF amt>0 THEN
    INSERT INTO fine VALUES(roll,CURDATE(),days,amt);
END IF;

END &&
    
DELIMITER ;












