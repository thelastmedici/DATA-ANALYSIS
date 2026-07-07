# Data Analysis Projects

This repository contains small data analysis projects and supporting datasets. The current project analyzes motorcycle spare part sales using SQL.

## Project: Motorcycle Spare Part Sales

The `motorcycle_spare_part_sale` folder contains a sales analysis exercise for a motorcycle parts company. The company sells to retail and wholesale clients through three warehouses and wants to understand wholesale net revenue by product line, month, and warehouse.

### Objective

Calculate net revenue for wholesale orders only, grouped by:

- `product_line`
- order month
- `warehouse`

Net revenue is calculated as:

```sql
total * (1 - payment_fee)
```

### Repository Structure

```text
.
├── README.MD
└── motorcycle_spare_part_sale/
    ├── data/
    │   └── sales.csv
    ├── sql/
    │   └── query.sql
    ├── motorcycle.jpg
    └── motocycle_sales_analysis.ipynb
```

### Dataset

The dataset is stored at `motorcycle_spare_part_sale/data/sales.csv` and contains 999 sales records from June to August 2021.

| Column | Description |
| --- | --- |
| `order_number` | Unique order identifier |
| `date` | Order date |
| `warehouse` | Warehouse used for the order: `North`, `Central`, or `West` |
| `client_type` | Customer type: `Retail` or `Wholesale` |
| `product_line` | Type of motorcycle part sold |
| `quantity` | Number of items ordered |
| `unit_price` | Price per item |
| `total` | Gross order total |
| `payment` | Payment method: `Credit card`, `Transfer`, or `Cash` |
| `payment_fee` | Fee rate applied to the order total |

### Analysis Query

The notebook contains the completed query used to calculate wholesale net revenue:

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

The `motorcycle_spare_part_sale/sql/query.sql` file currently contains a starter query for inspecting the `sales` table.

### How to Use

1. Open `motorcycle_spare_part_sale/motocycle_sales_analysis.ipynb` in Jupyter, DataCamp Workspace, VS Code, or another notebook environment.
2. Load `motorcycle_spare_part_sale/data/sales.csv` into a SQL table named `sales`.
3. Run the analysis query above to calculate net revenue by product line, month, and warehouse.

### Notes

- The notebook was created in a DataCamp-style workspace and includes the original exercise prompt.
- The project is SQL-focused; there is no Python package or application entry point.
- The local `.venv` and IDE files are development artifacts and are not required to understand or run the analysis.
