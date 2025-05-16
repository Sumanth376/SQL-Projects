# 🥣 SQL Project: Cereal Dataset Analysis

This SQL project demonstrates data analysis on a nutritional cereal dataset using MySQL. The project involves table manipulation, data transformation, filtering, aggregations, views, subqueries, and categorization techniques — all designed to extract meaningful insights from breakfast cereal product data.

---

## 📁 Dataset Overview

The dataset `cereals_data.csv` contains nutritional information for 77 different cereals. Each record includes:

- **Basic Info**: `name`, `mfr` (manufacturer), `type` (Hot/Cold)
- **Nutrition**: `calories`, `protein`, `fat`, `sodium`, `fiber`, `carbo`, `sugars`, `potass`, `vitamins`
- **Packaging**: `shelf`, `weight`, `cups`
- **Consumer Rating**: `rating`

---

## 🧠 SQL Tasks Performed

### 🔧 Database Setup & Schema Management

- Created database `CEREALS_DB` and used `CEREALS_DATA` table.
- Added a `PRIMARY_KEY` using `AUTO_INCREMENT`.
- Described the schema structure using `DESCRIBE`.

```sql
ALTER TABLE CEREALS_DATA ADD COLUMN PRIMARY_KEY INT PRIMARY KEY AUTO_INCREMENT;
