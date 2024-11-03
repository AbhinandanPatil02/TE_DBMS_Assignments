
create table area2(
    radius int,
    areacal float
);

DELIMITER &&
CREATE OR REPLACE PROCEDURE calarea2()
BEGIN
DECLARE rad INT DEFAULT 5;
DECLARE ar FLOAT;

WHILE rad <=9 DO
SET ar=3.14*rad*rad;
INSERT INTO area2 VALUES (rad,ar);
SET rad=rad+1;
END WHILE;

END &&

DELIMITER ;














