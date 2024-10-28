CREATE TABLE old(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    emp_salary INT
);

INSERT INTO old values (1 ,"Abhi",48736546);
INSERT INTO old values (2 ,"Sahil",48736546);
INSERT INTO old values (3 ,"Aniruddha",48736546);
INSERT INTO old values (8,"Ravindra",48736546);

CREATE TABLE new(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    emp_salary INT
);



delimiter &&
create or replace procedure uptable ()
begin
declare done int default 0;
declare oemp_id INT;
declare oname VARCHAR(30);
declare oemp_salary INT ;
declare curr CURSOR FOR SELECT emp_id ,emp_name,emp_salary FROM old;
declare continue handler for NOT FOUND set done =1;
OPEN curr;
read_loop :LOOP
FETCH curr INTO oemp_id,oname,oemp_salary ;
IF done THEN 
    LEAVE read_loop;
END IF;
IF oemp_id NOT IN (select emp_id from new) THEN
    INSERT INTO new values(oemp_id,oname,oemp_salary);
    select "New Entry is inserted into new table " as message ;
END IF;
END loop;
close curr;
END &&
delimiter ;


