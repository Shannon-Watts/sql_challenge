-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/phZ2vr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Employee" (
    "Employee_no" INT   NOT NULL,
    "Employee_title_id" VARCHAR(10)   NOT NULL,
    "Birth_date" INT   NOT NULL,
    "First_name" VARCHAR(30)   NOT NULL,
    "Last_name" VARCHAR(30)   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Hire_date" INT   NOT NULL,
    CONSTRAINT "pk_Employee" PRIMARY KEY (
        "Employee_no"
     )
);

CREATE TABLE "Departments" (
    "Department_no" INT   NOT NULL,
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

CREATE TABLE "Titles" (
    "Employee_title_id" VARCHAR(10)   NOT NULL,
    "Employee_title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "Employee_title_id"
     )
);

ALTER TABLE "Employee" ADD CONSTRAINT "fk_Employee_Employee_title_id" FOREIGN KEY("Employee_title_id")
REFERENCES "Titles" ("Employee_title_id");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Department_no" FOREIGN KEY("Department_no")
REFERENCES "Employee" ("Last_name");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_Department_name" FOREIGN KEY("Department_name")
REFERENCES "Titles" ("Employee_title_id");

ALTER TABLE "Employee_dept" ADD CONSTRAINT "fk_Employee_dept_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Employee" ("");

ALTER TABLE "Employee_dept" ADD CONSTRAINT "fk_Employee_dept_Department_no" FOREIGN KEY("Department_no")
REFERENCES "Titles" ("");

ALTER TABLE "Employee_salary" ADD CONSTRAINT "fk_Employee_salary_Salary" FOREIGN KEY("Salary")
REFERENCES "Employee" ("Employee_no");

ALTER TABLE "Departmant_manager" ADD CONSTRAINT "fk_Departmant_manager_Employee_no" FOREIGN KEY("Employee_no")
REFERENCES "Titles" ("Employee_title_id");

