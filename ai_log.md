# AI-Assisted Prompting Log

## Prompt #1 (RCTCF Framework)
- **Role:** Senior Analytics Engineer specializing in SQLite data warehousing.
- **Context:** Working on a BigBasket capstone project with a `category_targets` table (`category`, `target_revenue_inr`) and an aggregated category revenue CTE (`total_revenue`).
- **Task:** Write an SQL query calculating `variance`, `percentage_variance`, and a `performance_tag` CASE statement comparing category totals against target revenue.
- **Constraints:** Must use SQLite syntax, avoid integer division truncation by explicitly multiplying by 100.0, and tag performance as 'Above Target', 'Below Target - Watch' (shortfall <= 15%), or 'Below Target - Critical'.
- **Format:** Clean SQL query with brief explanatory comments.

## Verification Step Performed
Executed the query directly against `bigbasket_capstone.db` inside Colab and manually verified the math for the 'Bakery' category: `(11425 - 12000) = -575` variance and `((11425 - 12000) * 100.0) / 12000 = -4.79%`, matching the performance tag 'Below Target - Watch'.
