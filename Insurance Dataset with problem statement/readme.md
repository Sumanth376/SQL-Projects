# 💼 Insurance Dataset with Problem Statement

**Objective:** Perform insurance customer analysis using demographic and financial information to extract insights and support policy-based decisions.

---

## 📊 Key Highlights:

- **Data Cleaning and Schema Modification**
  - Renamed `sex` column to `gender`.
  - Added a primary key on the `id` column.
  - Created a new column `ratio` (age * bmi).
  - Created a categorical column `HL_Charges` to label records as `High` or `Low` based on average charges.

- **Business Metrics and Filtering**
  - Counted policyholders by gender, region, and smoking status.
  - Identified customers with zero children or more than five children using `CASE` statements.
  - Retrieved top and bottom N records based on age and charges.
  - Filtered customers with `charges` above average and high BMI.

- **View Creation**
  - Created view `gender` to restrict access to sensitive columns.
  - Renamed view `gender` to `type`.
  - Created view `Female_HL_Charges` for smoking females with no children and high charges.

- **Aggregations and Groupings**
  - Calculated `MAX()`, `MIN()`, and `AVG()` charges overall and by gender.
  - Grouped records by region and gender for regional insights.

- **Subqueries**
  - Selected females whose BMI exceeds the average BMI of all females.
  - Retrieved customers with charges higher than the dataset average.

- **Data Classification**
  - Used `CASE WHEN` to classify number of children into labels like `Zero Children`, `one_children`, ..., `More_than_five_children`.

---

## 📁 Files Included

- `insurance.csv` – Raw dataset of policyholders.
- `Insurance Exercise Questions.pdf` – Task sheet containing analytical questions.
- `SOLVED SQL QUERRY OF INSURANCE DATASET.sql` – Complete SQL solution script.

---

## 🧠 Tools & Concepts Used

- MySQL (DDL, DML, Views, Aggregates, Subqueries)
- Data Aggregation & Grouping
- Conditional Logic using `CASE`
- View Management
- Performance Metrics
