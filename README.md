# Customer Churn & Retention Analytics Engine

## Project Overview
An end-to-end data analysis project investigating customer churn trends in a subscription-based telecommunications service. The goal is to identify core churn drivers, calculate revenue loss, and highlight at-risk high-value customer segments.

## Tech Stack
* **SQL:** Data aggregation, CTEs, Window functions (`DENSE_RANK`), conditional metrics (`CASE WHEN`).
* **Excel / Power BI:** Data visualization, KPI tracking, cohort exploration.

## Key Insights
* **Contract Risk:** Month-to-month contract users exhibit the highest churn rate (~42%) compared to one-year/two-year contracts.
* **Support Impact:** Customers with no technical support options had significantly higher attrition rates.
* **High-Value Exposure:** Identified top-tier spenders at risk of dropping out, representing potential monthly recurring revenue leakages.

## Repository Contents
* `churn_analysis.sql`: Analytical SQL queries for metrics and customer segmentation.
