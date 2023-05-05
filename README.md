# sql-challenge

The challenge consists of three parts: data modeling, data engineering, and data analysis.

### Data modeling
The six CSV files were inspected, and then an Entity Relationship Diagram of the tables was sketched. To create the sketch [QuickDBDL](https://www.quickdatabasediagrams.com/) was used.

### Data Engineering
A table schema for each of the six CSV files was created.
Each CSV file was imported into its corresponding SQL table.

### Data Analysis
SQL queries were written to answer the following questions:
- List the employee number, last name, first name, sex, and salary of each employee.

- List the first name, last name, and hire date for the employees who were hired in 1986.

- List the manager of each department along with their department number, department name, employee number, last name, and first name.

- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

- List each employee in the Sales department, including their employee number, last name, and first name.

- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).