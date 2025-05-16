# 🍽️ Danny’s Diner – SQL Customer Behavior Analysis

Welcome to Danny's Diner! In this SQL project, we explore the purchasing behavior of customers at a fictional restaurant using a clean relational schema. We analyze customer visits, menu items ordered, loyalty rewards, and member-based insights using SQL joins, window functions, conditional logic, and CTEs.

---

## 🧾 Dataset Overview

### 1. `members` table
| customer_id | join_date  |
|-------------|------------|
| A           | 2021-01-07 |
| B           | 2021-01-09 |

- Tracks the date each customer joined the loyalty program.

### 2. `menu` table
| product_id | product_name | price |
|------------|--------------|-------|
| 1          | sushi        | 10    |
| 2          | curry        | 15    |
| 3          | ramen        | 12    |

- Menu of available dishes and their corresponding prices.

### 3. `sales` table
| customer_id | order_date | product_id |
|-------------|------------|------------|
| A           | 2021-01-01 | 1          |
| A           | 2021-01-01 | 2          |
| A           | 2021-01-07 | 2          |
| A           | 2021-01-10 | 3          |
| A           | 2021-01-11 | 3          |
| A           | 2021-01-11 | 3          |
| B           | 2021-01-01 | 2          |
| B           | 2021-01-02 | 2          |
| B           | 2021-01-04 | 1          |
| B           | 2021-01-11 | 1          |
| B           | 2021-01-16 | 3          |
| B           | 2021-02-01 | 3          |

---

## 🔍 Questions Answered with SQL
