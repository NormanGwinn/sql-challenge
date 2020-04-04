-- Create the database
DROP DATABASE IF EXISTS hr_data_recovery;
CREATE DATABASE hr_data_recovery;

-- Create the tables
DROP TABLE IF EXISTS employee2department;
DROP TABLE IF EXISTS manager2department;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS stage_dept_manager;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

CREATE TABLE "department" (
    "id" char(4)   NOT NULL,
    "name" varchar(32)   NOT NULL,
    CONSTRAINT "pk_department" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "employee" (
    "id" integer   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(64)   NOT NULL,
    "last_name" varchar(64)   NOT NULL,
    "gender" char(1)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "employee2department" (
    "employee_id" int   NOT NULL,
    "department_id" char(4)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_employee2department" PRIMARY KEY (
        "employee_id","department_id","from_date","to_date"
     )
);

CREATE TABLE "stage_dept_manager" (
    "dept_id" char(4)   NOT NULL,
    "employee_id" integer   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

CREATE TABLE "manager2department" (
    "employee_id" integer   NOT NULL,
    "department_id" char(4)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_manager2department" PRIMARY KEY (
        "employee_id","department_id","from_date","to_date"
     )
);

CREATE TABLE "salary" (
    "employee_id" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_salary" PRIMARY KEY (
        "employee_id","from_date","to_date"
     )
);

CREATE TABLE "title" (
    "employee_id" int   NOT NULL,
    "title" varchar(32)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL,
    CONSTRAINT "pk_title" PRIMARY KEY (
        "employee_id","from_date","to_date"
     )
);

ALTER TABLE "employee2department" ADD CONSTRAINT "fk_employee2department_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

ALTER TABLE "employee2department" ADD CONSTRAINT "fk_employee2department_department_id" FOREIGN KEY("department_id")
REFERENCES "department" ("id");

ALTER TABLE "manager2department" ADD CONSTRAINT "fk_manager2department_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

ALTER TABLE "manager2department" ADD CONSTRAINT "fk_manager2department_department_id" FOREIGN KEY("department_id")
REFERENCES "department" ("id");

ALTER TABLE "salary" ADD CONSTRAINT "fk_salary_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

ALTER TABLE "title" ADD CONSTRAINT "fk_title_employee_id" FOREIGN KEY("employee_id")
REFERENCES "employee" ("id");

