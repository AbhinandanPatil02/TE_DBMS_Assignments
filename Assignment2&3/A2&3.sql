
-- ● Employee( Emp_id, Dept_id, Emp_fname, Emp_lname, Emp_Position,
-- Emp_salary,Emp_JoinDate)
-- ● Dept ( Dept_id, Dept_name,Dept_location ,)
-- ● Project( Proj_id,Dept_id ,Proj_Name,Proj_Location,Proj_cost,Proj_year)

CREATE TABLE dept(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30),
    dept_location VARCHAR(30)
);

INSERT INTO dept VALUES (1,"Dept_1","Pune");
INSERT INTO dept VALUES (2,"Dept_2","Kolhapur");
INSERT INTO dept VALUES (3,"Dept_3","Mumbai");
INSERT INTO dept VALUES (4,"Computer","Kolhapur");
INSERT INTO dept VALUES (5,"IT","Kolhapur");

CREATE TABLE employee(
    emp_id INT PRIMARY KEY,
    dept_id INT,
    emp_name VARCHAR(30),
    emp_position VARCHAR(30),
    emp_salary INT,
    emp_joindate DATE,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id) ON DELETE CASCADE
);

INSERT INTO employee VALUES (1,1,"Abhi","Pos_1",78555,"2022-08-12");
INSERT INTO employee VALUES (2,2,"Harshad","Pos_2",78555,"2012-08-12");
INSERT INTO employee VALUES (3,1,"Vinayak","Pos_3",78555,"2022-02-12");
INSERT INTO employee VALUES (4,3,"Aniruddha","Pos_10",78555,"2007-08-12");
INSERT INTO employee VALUES (5,2,"Onkar","Pos_8",78555,"1980-08-12");
INSERT INTO employee VALUES (6,1,"Satish","Pos_5",78555,"2022-08-02");
INSERT INTO employee VALUES (7,3,"Shreyash","Pos_6",78555,"2022-10-12");
INSERT INTO employee VALUES (8,3,"Virat","Pos_7",78555,"2022-08-14");
INSERT INTO employee VALUES (9,2,"Rohit","Pos_4",78555,"2002-08-12");
INSERT INTO employee VALUES (10,3,"Thala","Pos_3",78555,"2007-07-07");
INSERT INTO employee VALUES (11,4,"Hardik","Pos_4",78555,"2002-08-12",2004);
INSERT INTO employee VALUES (12,5,"Kunal","Pos_3",78555,"2007-07-07",2007);



CREATE TABLE project(
    proj_id INT PRIMARY KEY,
    dept_id INT ,
    proj_name VARCHAR(30),
    proj_location VARCHAR(30),
    proj_cost INT,
    proj_year INT,
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)ON DELETE CASCADE
);

INSERT INTO project VALUES(1,1,"Proj_1","Kolhapur",5451555,1980);
INSERT INTO project VALUES(2,2,"Proj_2","Pune",5451555,2020);
INSERT INTO project VALUES(3,3,"Proj_3","Hydrabad",5451555,2014);
INSERT INTO project VALUES(4,2,"Proj_4","Mumbai",5451555,2024);


-- 2. Display all Employee details with Department ‘Computer’ and ‘IT’ and Employee
-- first name starting with 'p' or 'h'.
--  SELECT * from employee where dept_id in (select dept_id from dept where dept_name in ("Computer","IT")) AND( emp_name LIKE "p%" or emp_name LIKE "h%");


-- 3. lists the number of different Employee Positions.
--    SELECT COUNT(DISTINCT(emp_position)) FROM employee;


-- 4. Give 10% increase in Salary of the Employee whose joining year is before 1985.
--  ALTER TABLE employee ADD COLUMN emp_join_year INT default 1980;
--  UPDATE employee SET emp_salary=emp_salary+emp_salary*0.1 WHERE emp_join_year <1985;


-- 5. Delete Department details which location is ‘Mumbai’.
--   DELETE FROM dept WHERE dept_location="Mumbai";


-- 6. Find the names of Projects with location ‘pune’ .
--   SELECT proj_name FROM project where proj_location="Pune";


-- 7. Find the project having cost in between 100000 to 500000.
-- SELECT * FROM project WHERE proj_cost between 100000 and 500000;


-- 8. Find the project having maximum price and find average of Project cost
--    SELECT max(proj_cost),avg(proj_cost) FROM project;


-- 9. Display all employees with Emp _id and Emp name in decreasing order of
-- Emp_lname
-- SELECT emp_id,emp_name FROM project ORDER BY emp_lname DESC;


-- 10. Display Proj_name,Proj_location ,Proj_cost of all project started in 2004,2005,2007

--   SELECT proj_name,proj_location,proj_cost from employee where proj_year in (2004,2005,2007);







-- 1. Find Employee details and Department details using NATURAL JOIN.
-- SELECT * from employee NATURAL JOIN dept;

-- 2. Find the emp_fname,Emp_position,location,Emp_JoinDate who have same Dept id.
-- SELECT e.emp_name ,e.emp_position, d.dept_location ,e.emp_joindate FROM employee e JOIN dept d ON e.dept_id=d.dept_id GROUP BY d.dept_id;

-- 3. Find the Employee details ,Proj_id,Project cost who does not have Project
-- location as ‘Hyderabad’.
-- SELECT e.emp_name,e.emp_id,p.proj_id,p.proj_cost  from employee e join dept d on e.dept_id=d.dept_id join project p on p.dept_id=d.dept_id  WHERE p.proj_location !='Hydrabad';

-- 4. Find Department Name ,employee name, Emp_position for which project year
-- is 2020,
-- SELECT d.dept_name,e.emp_name ,e.emp_position FROM dept d join employee e on d.dept_id=e.dept_id join project p on p.dept_id=d.dept_id where p.proj_year=2020;

-- 5. Display emp_position,D_name who have Project cost >30000
--    SELECT e.emp_position,d.dept_name,p.proj_id from employee e join dept d on e.dept_id=d.dept_id join project p on p.dept_id = d.dept_id WHERE p.proj_cost>30000;

-- 6. Find the names of all the Projects that started in the year 2015.
--    SELECT p.proj_name from project p where p.proj_year = 2015;

-- 7. List the Dept_name having no_of_emp=10
--    SELECT d.dept_name from dept d where d.dept_id IN (SELECT e.dept_id from employee e group by e.dept_id HAVING count(distinct(e.emp_id))>10  );

-- 8.Display the total number of employee who have joined any project before 2009
--   SELECT COUNT(e.emp_id) FROM employee e where e.dept_id in (SELECT dept_id from project p where p.proj_year<2009);

-- 9. Create a view showing the employee and Department details.
--    CREATE OR REPLACE VIEW empdept AS SELECT * FROM employee NATURAL JOIN dept;

-- 10. Perform Manipulation on simple view-Insert, update, delete, drop view.
--     INSERT INTO empdept (dept_id , emp_id , emp_name , emp_position , emp_salary , emp_joindate , emp_join_year , dept_name , dept_location ) VALUES (2, 13 ,"Sandesh","pos_8",85144,"2015-04-01",2003,"Dept_3","Mumbai");
--     UPDATE empdept set emp_name="Changed_name" where emp_id = 2;
--     DELETE from empdept where emp_id =2;
--     drop empdept;





