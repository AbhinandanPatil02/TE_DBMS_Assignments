
create table areacal(
    radius int,
    areacal float
);


DELIMITER &&

CREATE OR REPLACE PROCEDURE areaofCircle2(IN rad INT)
BEGIN
    DECLARE area FLOAT;

    IF (rad < 5) OR (rad > 9) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Radius';
        -- SELECT "Enter valid r" as message;
    ELSE
        SET area = 3.14 * rad * rad;
        INSERT INTO areacal VALUES (rad, area);
    END IF;
END &&

DELIMITER ;















