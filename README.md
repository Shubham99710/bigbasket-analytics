# bigbasket-analytics

# BigBasket SQL Analytics & Data Pipeline
A comprehensive end-to-end data engineering and analytics project for BigBasket dataset analysis. This repository includes synthetic data generation scripts, automated database setup, structured SQL querying modules, and full AI usage documentation.

# 🚀 Key Features & Modules
Data Generation Pipeline (generate_data.py): Automatically creates structured e-commerce data (customers, products, categories, orders, transaction logs) and exports them into CSV, SQLite (.db), and Excel formats.

SQL Foundations (01_foundations.sql): Schema architecture, table definitions, primary/foreign key relationships, and basic data extraction queries.

Aggregations & Joins (02_aggrgation_joins.sql): Business logic layer featuring multi-table JOIN operations, sales performance aggregations, and category-level insights.

Advanced Analytics (03_reporting.sql): Executive-level reporting, retention metrics, running totals, customer segmentation, and window functions.

AI Assistance Log (ai_log.md): Complete track record of prompts, debugging steps, and AI collaboration used to construct and optimize this project.

# Sample Datasets Included
bigbasket.db: Fully populated SQLite relational database.

bigbasket_data.xlsx: Multi-sheet workbook containing customer and product order data.

customer_orders.csv: Transactional export for quick data analysis or pandas manipulation.
