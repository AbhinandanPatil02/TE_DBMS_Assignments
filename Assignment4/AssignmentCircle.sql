
create table area2(
    radius int,
    areacal float
);


DELIMITER &&
CREATE OR REPLACE procedure calarea(in rad INT)
BEGIN 
DECLARE area FLOAT DEFAULT 0;
if rad<5 or rad >9 THEN 
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Invalid radius (select value between 5 to 9 )";
else 
    SET area=3.14*rad*rad;
    INSERT INTO calareaofcircle VALUES (rad,area);
END if;
END &&
DELIMITER ;















