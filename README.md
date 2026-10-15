# CustomerDNA: Retail Customer Segmentation & Spending Behavior Analytics

## Project Overview

CustomerDNA is a retail analytics project built around the UCI Online Retail II dataset. It combines transaction-level analysis, customer segmentation, and interactive Power BI reporting to explore purchasing behaviour and support data-driven retail decisions.

## Business Problem

Retailers need to understand sales patterns, customer purchasing frequency, spending behaviour, and customer inactivity to make better decisions about customer retention and marketing.

## Project Objectives

- Analyse retail sales and transaction trends.
- Assess data quality and prepare transaction records for analysis.
- Calculate customer-level Recency, Frequency, and Monetary (RFM) metrics.
- Explore customer segments using clustering techniques.
- Develop an interactive Power BI dashboard.
- Translate validated findings into practical business recommendations.

## Dataset and Source

This project uses the **Online Retail II** dataset from the UCI Machine Learning Repository.

- **Source:** [UCI Machine Learning Repository — Online Retail II](https://archive.ics.uci.edu/dataset/502/online+retail+ii)
- **Original creator:** Daqing Chen
- **Records:** 1,067,371 transactions
- **Coverage:** 1 December 2009 – 9 December 2011
- **Business context:** Transactions from a UK-based, non-store online retailer selling giftware.
- **License:** Creative Commons Attribution 4.0 International (CC BY 4.0)

### Dataset Fields

The dataset contains invoice identifiers, product codes and descriptions, quantities, invoice dates, unit prices, customer identifiers, and country information.

### Data Attribution

Chen, D. (2012). *Online Retail II* [Dataset]. UCI Machine Learning Repository. https://doi.org/10.24432/C5CG6D.

The dataset is used for educational and analytical purposes. Data cleaning and transaction-filtering decisions are documented as part of this project.

## Project Workflow

1. **Data Loading:** Import both sheets of the Online Retail II dataset and combine them into a single dataset.
2. **Data Quality Assessment:** Examine missing values, duplicate records, cancellations, returns, and invalid transaction values.
3. **Data Preparation:** Document cleaning and transaction-filtering rules while preserving the original dataset for comparison.
4. **Exploratory Data Analysis:** Analyse sales trends, product performance, country-level activity, and transaction patterns.
5. **RFM Analysis:** Calculate customer-level Recency, Frequency, and Monetary metrics.
6. **Customer Segmentation:** Explore customer groups using clustering techniques and assess their analytical usefulness.
7. **Power BI Dashboard:** Present retail performance and customer segmentation through interactive visualisations.
8. **Business Recommendations:** Develop potential actions for customer retention, re-engagement, and marketing based on validated findings.

## Tools and Technologies

- **Python:** Data processing and analysis
- **Pandas and NumPy:** Data manipulation and numerical analysis
- **Jupyter Notebook:** Exploratory data analysis and documentation
- **Scikit-learn:** Customer segmentation and clustering
- **Power BI:** Interactive dashboard development
- **SQL:** Planned retail analytics queries

## Repository Structure

```text
CustomerDNA_Retail_Analytics/
├── dashboard/       # Power BI report
├── data/
│   ├── raw/         # Original dataset (excluded from Git)
│   └── processed/   # Derived analytical datasets
├── notebooks/       # Exploratory analysis notebooks
├── reports/         # Supporting analysis and outputs
├── sql/             # SQL queries (to be added)
├── src/             # Reusable Python scripts (to be added)
├── .gitignore
└── README.md
```

## Project Status

The project is under development. Data preparation, analytical validation, and documentation are ongoing. Final findings and business recommendations will be added after validation.