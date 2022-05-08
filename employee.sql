CREATE TABLE "Titles" (
    "Employee_title_id" VARCHAR(10)   NOT NULL,
    "Employee_title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Employee_title_id"
     )
);

CREATE TABLE "Employee" (
    "Employee_no" INT   NOT NULL,
    "Employee_title_id" VARCHAR(10)   NOT NULL,
    "First_name" VARCHAR(30)   NOT NULL,
    "Last_name" VARCHAR(30)   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "Employee_no"
     )
);

CREATE TABLE "Departments" (
    "Department_no" VARCHAR(30)  NOT NULL,
    "Department_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "Department_no"
     )
);

CREATE TABLE "Employee_dept" (
    "Employee_no" INT   NOT NULL,
    "Department_no" VARCHAR(10)   NOT NULL
);

CREATE TABLE "Employee_salary" (
    "Employee_no" INT   NOT NULL,
    "Salary" INT   NOT NULL
);

CREATE TABLE "Departmant_manager" (
    "Department_no" VARCHAR(10)   NOT NULL,
    "Employee_no" INT   NOT NULL
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_Employee_title_id" FOREIGN KEY("Employee_title_id")
REFERENCES "Titles" ("Employee_title_id");

--ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Department_no" FOREIGN KEY("Department_no")
--REFERENCES "Employee" ("Last_name");

--ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Department_name" FOREIGN KEY("Department_name")
--REFERENCES "Titles" ("Employee_title_id");

ALTER TABLE "Employee_dept" ADD CONSTRAINT "fk_Employee_dept_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employee" ("Employee_no");

--ALTER TABLE "Employee_dept" ADD CONSTRAINT "fk_Employee_dept_Department_no" FOREIGN KEY("Department_no")
--REFERENCES "Titles" ("Department_no");

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_dept_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employee" ("Employee_no");

ALTER TABLE "Departmant_manager" ADD CONSTRAINT "fk_Departmant_manager_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employee" ("Employee_no");


-- Data analysis
-- List the following details of each employee: employee number, last name, first name, sex, and salary.


SELECT "Employee.Employee_no", "Employee.Last_name", "Employee.First_name", "Employee.Sex", "Employee_salary.Salary"
FROM "Employee"
JOIN "Employee_salary"
ON "Employee.Employee_no" = "Salaries.Employee_no";

SELECT "Departments.Department_no", "Departments.Department_name", "Departmant_manager.Employee_no", "Employee.Last_name", "Employee.First_name"
FROM "Departments"
JOIN "Departmant_manager"
ON "Departments.Department_no" = "Departmant_manager.Department_no"
JOIN "Employee"
ON "Departmant_manager.Employee_no", "Employee.Employee_no";

SELECT "Employee_dept.Employee_no", "Employee.Last_name", "Employee.First_name", "Departments.Department_name"
FROM "Employee_dept"
JOIN "Employee"
ON "Employee_dept.Employee_no" = "Employee.Employee_no"
JOIN "Departments"
ON "Employee_dept.Department_no" = "Departments.Department_no";

SELECT "Employee.First_name", "Employee.Last_name", "Employee.sex"
FROM "Employee"
WHERE "First_name" = 'Hercules'
AND "Last_name" Like 'B%'

SELECT "Employee_dept.Department_name", "Employee.Last_name", "Employee.First_name"
FROM "Employee_dept
JOIN "Employee
ON "Employee_dept.Employee_no" = "Employee.Employee_no"
JOIN "Departments"
ON "Employee_dept.Department_no" = "Departments.Department_no"
WHERE "Dpartments.Department_name" = 'Sales';

FROM "Employee_dept"
JOIN "Employee"
ON "Employee_dept.Employee_no" = "Employee.Employee_no"
JOIN "Departments"
ON "Employee_dept.Department_no" = "Departments.Department_no"
WHERE "Departments.Department_name" = 'Sales' 
OR "Departments.Department_name" = 'Development';

SELECT "Last_name",
COUNT("Last_name")
FROM "Employees"
GROUP BY "Last_name"



