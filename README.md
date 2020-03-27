# sql-challenge
Homework 09 -- SQL

I recently became enamored with the classification of SQL commands as DDL, DML, DQL, and DCL.  For this introductory SQL challenge, I elected to name my SQL files with this nomenclature.

### DDL.sql

This file creates the database, and creates the tables in the public (default) schema.  Run this file within pgAdmin4.

I used Quick DBD to design the tables.  The schema is listed and diagrammed in these two files:

* ERD.pdf
* ERD.png

### DML.bat and DML.sql

This SQL file uploads data from the CSV files in a parallel directory named "data", to populate tables of the database.  For consistency, I wanted both the employee2department and manager2department tables to have the column names in the same sequence.  Since the dept_manager CSV did not support this objective, I created an intermediate "staging" table for the initial loading from CSV, and then transferred the records into the manager2department table.

Use the batch file to specify the host, user, and port, and execute the SQL file.  This requires the user's password to be loaded in an environment variable named PGPASSWORD.  This requires psql.exe to be in the environment PATH.

I hoped to use psql.exe more broadly, but ran into nagging little problems (like invalid characters found in files) and decided to rejoin that battle another time.

### DQL.sql

This SQL file contains the eight required SQL statements.  Run this file within pgAdmin4.

## BONUS

The Jupyter Notebook for this effort is DataRecover.ipynb.  The two plots are:

* SalaryDistribution.png
* SalaryByTitle.png

Several aspects of this data set are questionable.  

* No employee shows salary growth.
* Salary does not change with title change.
* Average salaries do not increase with seniority (implied by titles).
* All salaries have end dates, but many titles have "end-of-time" or NaT (null) end dates.  The end dates (per employee) in these two tables should be consistent (unless the title table is useful for pension payouts at a later time).

The employee named April Foolsday is the final nail in the coffin.  This data set is bogus.