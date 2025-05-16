# 🍕 SQL Project: Pizza Runner Case Study

This SQL project is based on the popular fictional business case study **Pizza Runner**, which simulates the operational data of a pizza delivery service. It involves schema design, data cleaning, complex querying, business insights, and customer behavior analysis using SQL.

---

## 📦 Schema Overview

The project defines and uses the following relational tables:

- **runners** – Runner ID and registration date
- **customer_orders** – Orders placed by customers (with exclusions and extras)
- **runner_orders** – Delivery details (pickup time, distance, duration, cancellations)
- **pizza_names** – Pizza ID to name mapping
- **pizza_recipes** – Recipe ingredients for each pizza
- **pizza_toppings** – Topping ID to name mapping

---

## 🔍 Key SQL Analysis & Business Insights

### 1. ✅ Order Volume
- **Total pizzas ordered**: Counted all records from `customer_orders`.
- **Unique customer orders**: Counted unique `order_id`.
