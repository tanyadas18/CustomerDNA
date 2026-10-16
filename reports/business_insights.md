# CustomerDNA: Business Insights & Recommendations

## 1. Project Objective

CustomerDNA analyses retail transaction data to understand sales performance, customer purchasing behaviour, and customer segments. The objective is to translate transaction-level data into actionable insights that support customer retention and business decision-making.

## 2. Dataset Overview

- **Dataset:** UCI Online Retail II
- **Period:** December 2009 – December 2011
- **Original records:** 1,067,371
- **Records after exact duplicate removal:** 1,033,036
- **Analysis approach:** Exploratory Data Analysis (EDA), sales trend analysis, and Recency, Frequency, and Monetary (RFM) customer segmentation.

*Note: The dataset contains historical transactions. Sales line value is calculated as quantity multiplied by unit price; it should not be interpreted as profit.*

## 3. Key Analytical Findings

### 3.1 Sales Performance

The provisional positive-sales dataset contains 1,007,913 transaction rows with a combined line value of 20,476,260.45 in the dataset's recorded monetary units.

This measure represents transaction line value, not net revenue or profit. Returns, cancellations, other adjustments, and accounting treatment must be considered before drawing financial conclusions.

The monthly KPI output shows variation in sales line value across the first six months reviewed. March 2010 recorded a sales line value of 830,915.261, compared with 551,504.726 in February 2010. Invoice counts increased from 1,201 to 1,681 over the same period. These observations describe the selected months only; the complete time series must be reviewed before identifying overall trends or seasonality.

### 3.2 Customer Segmentation

The current RFM output contains 5,878 customers across four segments.

| Customer segment | Customers | Share |
|---|---:|---:|
| Dormant / Low-Value | 1,973 | 33.57% |
| Recent / Lower-Spend | 1,250 | 21.27% |
| High-Value / Frequent | 1,196 | 20.35% |
| Established / Moderate-Value | 1,459 | 24.82% |
| **Total** | **5,878** | **100%** |

These segment labels describe the current segmentation output. Their business implications should be interpreted alongside the RFM definitions, observation period, and validation results.

### Customer Monetary Contribution

The SQL analysis shows that the **High-Value / Frequent** segment contributes 73.87% of total customer monetary value while accounting for 20.35% of identified customers (1,196 of 5,878).

The **Established / Moderate-Value** segment contributes 16.36%, followed by **Recent / Lower-Spend** at 6.17% and **Dormant / Low-Value** at 3.60%.

**Business implication:** Retention initiatives for High-Value / Frequent customers may help protect a substantial share of customer monetary value. The Dormant / Low-Value segment, which represents the largest group by customer count, could be evaluated for targeted re-engagement campaigns.

*Note: Monetary contribution represents the sum of customer-level monetary values in the RFM analysis. It should not be interpreted as profit or accounting revenue.*

## 4. Business Recommendations

### 4.1 Dormant / Low-Value Customers

- Test targeted reactivation campaigns for customers who have not purchased recently.
- Use limited-time offers selectively rather than offering discounts to every dormant customer.
- Track reactivation rate, repeat purchases, and campaign cost.

### 4.2 Recent / Lower-Spend Customers

- Test product recommendations, relevant bundles, and post-purchase engagement.
- Encourage a second purchase through relevant offers and reminders.
- Measure repeat-purchase rate and average customer spending.

### 4.3 High-Value / Frequent Customers

- Consider loyalty benefits and personalised product recommendations.
- Monitor changes in purchase frequency and recency to identify potential disengagement.
- Evaluate retention and customer lifetime value when sufficient longitudinal data is available.

### 4.4 Established / Moderate-Value Customers

- Identify opportunities to increase repeat purchases and basket value.
- Use cross-selling and product recommendations where supported by purchasing patterns.
- Compare campaign outcomes against a baseline or control group.

These are proposed actions, not measured campaign outcomes. Their effectiveness must be tested using appropriate performance metrics.

## 5. Limitations and Considerations

- The dataset represents historical transactions and may not reflect current retail behaviour.
- Exact duplicate removal requires a business-rule assumption because identical transaction lines may occasionally be legitimate.
- Customer IDs are missing for a substantial portion of the original dataset; customer-level analysis therefore covers only identified customers.
- Transaction line value does not account for all costs and should not be treated as profit.
- RFM segments depend on the selected reference date, observation window, and segmentation method.
- Business recommendations require testing before implementation.

## 6. Next Steps

1. Validate RFM calculations, segment assignments, and the reference date used for recency.
2. Review the complete monthly sales time series, accounting for the partial December 2011 period.
3. Assess segment stability and identify opportunities to improve customer segmentation.
4. Test the proposed retention and re-engagement recommendations using measurable KPIs.
5. Improve reproducibility by documenting the analysis workflow, assumptions, and data-quality decisions.

---

**Project:** CustomerDNA — Retail Customer Segmentation & Spending Behavior Analytics