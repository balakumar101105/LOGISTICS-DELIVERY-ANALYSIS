# LOGISTICS DELIVERY PERFORMANCE ANALYSIS

## 📌 Project Overview

This project analyzes logistics delivery performance using Python, SQL, and Power BI.

The objective is to identify factors associated with delivery delays, understand delivery performance across different conditions, and analyze delivery costs.

The analysis is based on a dataset containing 25,000 delivery records across multiple delivery partners, regions, weather conditions, delivery modes, and package types.

> **Note:** The dataset is synthetic. The findings represent patterns within this dataset and should not be interpreted as real-world Indian logistics industry statistics.

---

## Tools

- Python
- Pandas
- NumPy
- PostgreSQL
- SQL
- Power BI
- DAX
- Jupyter Notebook

---

## 🔄 Project Workflow

```text
*Raw Data
   
*Data Understanding & Cleaning
   
*Exploratory Data Analysis
   
*SQL Business Analysis
   
*Power BI Dashboard
   
*Insights & Recommendations
```
##  Python Analysis

Python and Pandas were used to:
- Understand the dataset
- Check missing values
- Check duplicates
- Clean the data

##  SQL Analysis

PostgreSQL was used to analyze:
- Delay rate
- Delivery partners
- Weather
- Distance
- Delivery mode

##  Power BI Dashboard

The Power BI dashboard was created to provide an interactive view of:

Total deliveries
Delayed deliveries
Overall delay rate
Average delivery time
Average delivery cost
Average customer rating
Delay rate by weather
Delay rate by delivery mode
Delay rate by distance
Delay rate by delivery partner
Average cost by distance
Actual vs expected delivery time

```

\\ Key Findings
1. Weather is strongly associated with delivery delays

Within this dataset:

Stormy weather → 41.45% delay rate
Rainy weather → 37.35%
Foggy weather → 30.32%
Clear weather → 17.43%

This suggests adverse weather conditions are strongly associated with higher delivery delays in the dataset.

2. Longer distances have higher delay rates

The delay rate increased across distance ranges:

Distance	Delay Rate
0–50 km	17.01%
50–100 km	19.11%
100–150 km	23.95%
150–200 km	28.04%
200–250 km	33.01%
250+ km	38.79%

This shows a clear positive relationship between delivery distance and delay rate within the dataset.

3. Delivery mode affects delay performance

The delay rates were:

Delivery Mode	Delay Rate
Express	73.78%
Same Day	32.54%
Two Day	0.43%
Standard	0.00%

Express deliveries have a much higher delay rate in this dataset.

However, this should not automatically be interpreted as express delivery being operationally worse, because the delivery modes have very different expected delivery-time commitments.

\\ Overall KPIs
KPI	Value
Total Deliveries	25,000
Delayed Deliveries	6,669
Overall Delay Rate	26.68%
Average Delivery Time	6.25 hours
Average Delivery Cost	₹864.94
Average Rating	3.67 / 5

 \\ Business Recommendations

Based on the patterns identified in this dataset:

Give additional attention to deliveries during adverse weather conditions.
Review operational planning for long-distance deliveries.
Monitor express deliveries separately because their tighter delivery commitments result in higher observed delay rates.
Track delivery partner performance using delay rate, cost, and customer rating together.
Use distance and weather information when planning delivery expectations.
