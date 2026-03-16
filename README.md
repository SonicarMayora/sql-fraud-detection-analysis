# Credit Card Fraud Detection – SQL Analysis

## Project Overview

Financial fraud represents a significant risk for financial institutions and customers. Detecting suspicious transaction patterns early can reduce financial losses and improve risk management strategies.

This project explores credit card transaction data using SQL to identify patterns associated with fraudulent behavior. The analysis focuses on comparing fraudulent and legitimate transactions, analyzing transaction amounts, and identifying statistical differences in transaction features.

The goal is to demonstrate analytical SQL skills applied to a real-world financial dataset.

---

## Dataset

The analysis uses the **Credit Card Fraud Detection dataset**, which contains transactions made by European cardholders.

Key characteristics of the dataset:

* **Total transactions:** 284,807
* **Fraudulent transactions:** 492
* **Fraud rate:** ~0.17%
* **Features:** 31 variables (Time, V1–V28, Amount, Class)

Due to privacy concerns, the original transaction variables were transformed using Principal Component Analysis (PCA). Therefore, features **V1–V28** do not have a direct business interpretation but capture underlying transaction patterns useful for fraud detection.

The dataset can be downloaded from Kaggle and is not included in this repository due to file size limitations.

---

## Project Structure

```
credit-card-fraud-sql-analysis
│
├── data
│   README.md
│
├── sql
│   01_create_table.sql
│   02_analysis_queries.sql
│
└── README.md
```

---

## Analytical Objectives

The analysis aims to explore patterns in fraudulent transactions and answer the following questions:

* What percentage of transactions are fraudulent?
* Are fraudulent transactions associated with higher transaction amounts?
* What are the largest fraudulent transactions recorded?
* Are there statistical differences between fraudulent and legitimate transactions?
* Do certain transaction features show stronger differences between fraud and non-fraud?
* Are fraudulent transactions concentrated in specific time periods?

---

## SQL Analysis

The project uses PostgreSQL to perform exploratory analysis on the transaction data. SQL queries include:

* Aggregations
* Grouped analysis
* Statistical comparisons
* Sorting and filtering
* Transaction pattern exploration

Example query:

```sql
SELECT class, COUNT(*) AS transactions
FROM creditcard_transactions
GROUP BY class;
```

---

## Key Insights (to be completed)

This section will summarize the main findings of the analysis, including patterns in transaction amounts, fraud frequency, and statistical differences between fraudulent and legitimate transactions.

---

## Skills Demonstrated

* SQL data exploration
* Analytical querying
* Fraud pattern analysis
* Data documentation and project structuring
* GitHub project organization

---

## Author

Sonicar Mayora
Data Analyst | Business Intelligence | Data Science
