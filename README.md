# 🛍️ Customer Segmentation using Mall Customer Dataset

This project performs customer segmentation using clustering techniques on the Mall Customer dataset. The goal is to understand different customer groups based on features like Age, Annual Income, and Spending Score.

---

## 📊 Dataset

The dataset includes the following features:

- `CustomerID`
- `Gender`
- `Age`
- `Income` (Annual income in $000s)
- `Score` (Spending Score: 1–100)

---

## 🧪 Methods Used

- Data Cleaning & Preprocessing
- K-Means Clustering
- Cluster Analysis
- Data Visualization
- Insight Extraction

---

## 📁 Files Included

- `customer_segmentation.R` — Full R script for clustering, visualization, and insights
- `cluster_summary.csv` — Summary of each cluster with average age, income, and spending score
- `cluster_insights.csv` — Written insights based on cluster characteristics
- `cluster_plot.png` — Visualization of customer segments
- `README.md` — Project documentation

---

## 📌 Cluster Insights

| Cluster | Description |
|---------|-------------|
| 1 | Young, moderate-income, high-spending customers – likely trend-sensitive shoppers. |
| 2 | Young, slightly higher income, highest spending – high-value target for premium offerings. |
| 3 | Older customers with average income and low spending – focus on utility and convenience. |
| 4 | Middle-aged with highest income but lowest spending – potential to increase engagement. |
| 5 | Older, low-income, moderate spenders – possibly loyal customers seeking value. |

---

## 📈 Visualization

The visualization (`cluster_plot.png`) shows customer segments based on **Annual Income vs Spending Score**, color-coded by cluster.

---

## 🚀 Getting Started

1. Clone the repo:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
   cd YOUR_REPOSITORY
