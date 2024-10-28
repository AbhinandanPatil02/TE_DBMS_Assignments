

CREATE TABLE student (
    roll INT,
    name VARCHAR(30),
    mark INT 
);

create table result(
    roll INT,
    name VARCHAR(30),
    class VARCHAR(30)
);


INSERT INTO student values(1,"Abhi",75);
INSERT INTO student values(2,"Aniruddha",85);
INSERT INTO student values(3,"Sahil",55);
INSERT INTO student values(4,"Onkar",45);



delimiter &&
 CREATE OR REPLACE FUNCTION calmarks(marks INT)
    returns varchar(30)
    deterministic
    begin
    declare class varchar (30);
    if marks >=80 AND marks <=100 THEN
         set class ="A1";
    elseif marks>=50 AND marks<=79 THEN
         set class ="A2";
    else
        set class="A3";
    end if;
    return class;
    end &&
delimiter ;




delimiter &&
    create or replace procedure  pro1(IN roll INT)
    begin
    declare r INT ;
    declare n VARCHAR(30);
    declare mr INT;
    declare class varchar(30);
    select s.roll ,s.name ,s.mark INTO r,n,mr FROM student s WHERE roll=s.roll;
    set class = calmarks(mr);
    INSERT INTO result values (r,n,class);
    END &&
delimiter ;





