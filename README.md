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

1. Fraud transactions are extremely rare

The dataset contains 284,807 total transactions, of which only 492 are fraudulent.

This means that fraudulent transactions represent approximately 0.17% of all transactions.

This strong class imbalance is typical in financial fraud detection problems and presents challenges for analytical and machine learning models.

2. Fraudulent transactions have higher average amounts

The average transaction amount differs between legitimate and fraudulent transactions:

Transaction Type	Average Amount
Legitimate	~88
Fraudulent	~122

This suggests that fraudulent transactions tend to involve higher transaction values on average.

However, the difference is moderate rather than extreme.

3. Legitimate transactions reach much higher maximum values

The maximum transaction amount observed in legitimate transactions is significantly higher:

Transaction Type	Maximum Amount
Legitimate	~25,691
Fraudulent	~2,125

This indicates that very large transactions are more common among legitimate operations.

One possible explanation is that fraudsters avoid extremely large transactions because they may trigger fraud detection systems.

4. Zero-amount transactions occur mainly in legitimate activity

The analysis of transactions with amount = 0 shows:

Transaction Type	Zero-amount Transactions
Legitimate	1798
Fraudulent	27

This suggests that zero-value transactions are mostly associated with legitimate system processes, such as:

card verification

payment authorization checks

internal system validations

Fraudulent transactions rarely involve zero-amount operations.

5. Fraud transactions appear concentrated in mid-range values

Preliminary percentile analysis indicates that fraudulent transactions tend to occur in moderate transaction ranges rather than extreme values.

This pattern is consistent with common fraud behavior, where attackers attempt to:

avoid unusually large transactions

remain within ranges that appear less suspicious

Overall Interpretation

The analysis suggests that fraudulent transactions in this dataset tend to:

represent a very small proportion of total activity

involve moderately higher transaction amounts on average

avoid extremely large transactions

rarely appear in zero-amount system operations

These behavioral patterns are consistent with strategies used to reduce the likelihood of triggering automated fraud detection systems.
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
