# 🧑‍💼 Worker Table SQL Project with Bonus & Title Mapping

**Objective:** Perform SQL-based analysis on employee records to extract meaningful insights from worker information, salary trends, job titles, and bonus history. This project showcases over 50 diverse SQL operations from filtering, string functions, joins, subqueries, to ranking functions.

---

## 📊 Key Highlights:

- **Basic Retrieval and String Operations**
  - Selected names, uppercased names, substrings, and replaced characters using `UPPER()`, `SUBSTR()`, `REPLACE()`.
  - Combined first and last names using `CONCAT()` to generate full names.

- **Filtering and Pattern Matching**
  - Filtered records with `LIKE`, `IN`, and `BETWEEN` clauses.
  - Queried for employees based on character positions and conditions like ending with `'a'`, containing `'h'`, or names with 6 letters.

- **Ordering and Sorting**
  - Sorted results by `FIRST_NAME` and `DEPARTMENT`.
  - Retrieved first, last, top-N and bottom-N records using `ORDER BY` and `LIMIT`.

- **Aggregations and Grouping**
  - Counted workers by department.
  - Summed and averaged salaries.
  - Identified departments with fewer than 3 employees and computed total salary per department.

- **Joins**
  - Performed `INNER JOIN` between `worker`, `title`, and `bonus` tables.
  - Mapped workers with titles (e.g., Managers) and bonuses.

- **View of Promotions and Bonuses**
  - Fetched bonus counts and total salary of employees who received bonuses.
  - Identified employees who never received bonuses.

- **Subqueries and Ranking**
  - Used `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` to find:
    - Nth highest salary
    - Second highest salary
    - Employees with duplicate salaries

- **Row Selection and Cloning**
  - Displayed only even or odd rows using `MOD()`.
  - Cloned `worker` table using `CREATE TABLE AS SELECT`.

- **Date Functions**
  - Filtered workers who joined in a specific month/year (e.g., Feb 2014).
  - Displayed current timestamp using `NOW()`.

---

## 🧮 Sample Business Use Cases

- **Top Earners**: Identify highest-paid employees per department.
- **Manager Insights**: Find all workers designated as Managers.
- **Compensation Trends**: Calculate bonuses, total payouts, and department salary breakdowns.
- **Recruitment Analytics**: Filter new joiners by month/year.
- **Title Duplicates**: Detect roles with multiple effective records (e.g., multiple Executives).

---

## 📁 Tables Used

### 1. `worker`
| Column         | Description             |
|----------------|-------------------------|
| WORKER_ID      | Unique ID for worker    |
| FIRST_NAME     | First name              |
| LAST_NAME      | Last name               |
| SALARY         | Monthly salary          |
| JOINING_DATE   | Date of joining         |
| DEPARTMENT     | Department name         |

### 2. `bonus`
| Column         | Description             |
|----------------|-------------------------|
| WORKER_REF_ID  | Refers to `worker_id`   |
| BONUS_AMOUNT   | Bonus amount given      |
| BONUS_DATE     | Date of bonus issued    |

### 3. `title`
| Column         | Description             |
|----------------|-------------------------|
| WORKER_REF_ID  | Refers to `worker_id`   |
| WORKER_TITLE   | Job title (e.g., Manager, Lead) |
| AFFECTED_FROM  | Effective date          |

---

## 🧠 SQL Concepts Demonstrated

- String functions: `UPPER()`, `TRIM()`, `REPLACE()`, `SUBSTR()`
- Aggregation: `COUNT()`, `MAX()`, `AVG()`, `SUM()`
- Filtering: `LIKE`, `BETWEEN`, `IN`, `NOT IN`
- Sorting and Limiting: `ORDER BY`, `LIMIT`
- Conditional logic: `CASE WHEN`
- Joins: `INNER JOIN`
- Subqueries and Correlated Queries
- Ranking functions: `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- Date filters: `MONTH()`, `YEAR()`, `NOW()`
- Table cloning: `CREATE TABLE AS`
- Record duplication: `UNION ALL`

---

## 📁 Files Included

- `worker.sql` – Contains table creation and worker data
- `bonus.sql` – Bonus mapping
- `title.sql` – Titles and promotions
- `all_queries.sql` – Complete list of 50+ solved queries

---
