# 🎬 SQL Project: Movie Database Analysis

This SQL project is a comprehensive analysis of a relational movie database involving queries on movies, actors, directors, ratings, genres, and reviews. It demonstrates advanced SQL concepts such as joins, subqueries, window functions, views, and aggregation to extract business insights from a multi-table schema.

---

## 🗂️ Dataset Structure

The project uses a simulated relational movie database named `MOVIE_DB`, which includes the following key tables:

- **movie** – movie title, release year, language, runtime, country
- **actor** – actor details (name, gender)
- **cast** – roles played by actors in specific movies
- **ratings** – user ratings with number of ratings and stars
- **reviewer** – reviewer information
- **director** – director names
- **movie_direction** – mapping of movies to directors
- **genres** – movie genre master
- **movie_genres** – mapping of movies to genres

---

## 📊 Key SQL Tasks

### 🔍 Basic Queries
- Retrieve release year of `'American Beauty'`.
- Find movies released before 1998.
- List movies released after 1995 with a runtime > 120 minutes.
- Display the top 7 UK movies sorted by year.

### ✍️ Data Manipulation
- Update movie language to `'Chinese'` for specific conditions.
- Create views to simplify actor-movie-role retrieval.
- Use `ALTER TABLE` and `MODIFY` for data cleanup.

### 📌 Aggregations & Grouping
- Count number of ratings per movie.
- Find actors who played the most roles.
- Show genre-wise movie counts and maximum durations.
- Identify the movie with the most ratings.

### 🔗 Joins & Subqueries
- Fetch reviewer names for a specific movie.
- Get actors from `'Annie Hall'` using `IN` clause.
- Determine movies not released in the UK.
- List all actors who acted in `'Boogie Nights'`, `'Vertigo'`, `'The Lion King'`, etc.

### 📈 Advanced Analysis
- Use `DENSE_RANK()` to find actors from the third highest-rated movie.
- List actors who starred in both `'Drama'` and `'Comedy'`.
- Find directors who directed movies in genres like `'Action'`, `'Romance'`, `'Horror'`, `'Comedy'`.

### 🎯 Insightful KPIs
- Find:
  - Movies with the highest average rating.
  - Longest and shortest movies.
  - Actors with most genre diversity.
  - Directors with the most movies in a genre.
  - Average number of ratings per movie.
  - Movies with runtime between 100 and 150 minutes.

---

## 🧠 Sample SQL Techniques Used

- `INNER JOIN`, `LEFT JOIN`
- `GROUP BY`, `ORDER BY`, `HAVING`
- `DENSE_RANK()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`
- `IN`, `NOT IN`, `BETWEEN`, `LIKE`
- `UPDATE`, `ALTER TABLE`, `CREATE VIEW`
- Subqueries in `SELECT` and `WHERE` clauses

---

## ✅ Outcomes

- Built complex analytical SQL queries across multiple related tables.
- Extracted useful business insights on movies, ratings, actors, and directors.
- Demonstrated data manipulation and transformation using standard SQL.
- Identified trends across genres, languages, ratings, and actors' performances.

---

## 📁 Files Included

- `Movie Data Base.sql` – All SQL queries executed in this project.
- `Movie Dataset Query.pdf` – Original set of questions for reference.

---

## 📌 Getting Started

1. Create the database and tables in a MySQL environment.
2. Load sample data using the schema provided (not included here).
3. Execute queries step by step from `Movie Data Base.sql`.
