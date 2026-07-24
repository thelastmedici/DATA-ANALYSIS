# Data Analysis Portfolio

This repository contains small data analysis projects, datasets, and supporting files. The current analysis focuses on motorcycle spare part sales and uses SQL to calculate wholesale net revenue across product lines, months, and warehouses.

## Current Project

### Motorcycle Spare Part Sales

The `motorcycle_spare_part_sale` project analyzes sales data for a motorcycle parts company that sells to both retail and wholesale clients. The business operates three warehouses: `North`, `Central`, and `West`.

The main business question is:

> How much net revenue did wholesale orders generate by product line, month, and warehouse?

## Repository Structure

```text
.
├── README.MD
└── motorcycle_spare_part_sale/
    ├── data/
    │   └── sales.csv
    ├── sql/
    │   └── query.sql
    ├── motorcycle.jpg
    ├── motocycle_sales_analysis.ipynb
    ├── data_analyst.pdf
    └── guidelines-for-certification-of-documents.pdf
```

## Dataset

The sales dataset is stored at:

```text
motorcycle_spare_part_sale/data/sales.csv
```

It contains 999 sales records from June through August 2021.

| Column | Description |
| --- | --- |
| `order_number` | Unique order identifier |
| `date` | Order date |
| `warehouse` | Warehouse where the order was processed |
| `client_type` | Customer type: `Retail` or `Wholesale` |
| `product_line` | Motorcycle part category |
| `quantity` | Number of items ordered |
| `unit_price` | Price per item |
| `total` | Gross order value |
| `payment` | Payment method |
| `payment_fee` | Fee rate applied to the order total |

## Analysis

The analysis filters the data to wholesale orders only, then calculates net revenue using:

```text
net_revenue = total * (1 - payment_fee)
```

Results are grouped by:

- `product_line`
- order month
- `warehouse`

The final query used in the notebook is:

```sql
SELECT
    product_line,
    CASE
        WHEN EXTRACT('month' FROM date) = 6 THEN 'June'
        WHEN EXTRACT('month' FROM date) = 7 THEN 'July'
        WHEN EXTRACT('month' FROM date) = 8 THEN 'August'
    END AS month,
    warehouse,
    ROUND(SUM(total * (1 - payment_fee))::numeric, 2) AS net_revenue
FROM sales
WHERE client_type = 'Wholesale'
GROUP BY product_line, warehouse, month
ORDER BY product_line, month, net_revenue DESC;
```

## How to Run

1. Open `motorcycle_spare_part_sale/motocycle_sales_analysis.ipynb` in Jupyter, DataCamp Workspace, VS Code, or another notebook environment.
2. Load `motorcycle_spare_part_sale/data/sales.csv` into a SQL table named `sales`.
3. Run the SQL query above to calculate wholesale net revenue.

## Notes

- This is a SQL-focused analysis project, not a Python package or application.
- The notebook includes the original exercise prompt and the completed query.
- The local virtual environment and IDE files are development artifacts and are not required to run the analysis.
