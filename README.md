# Analysing-Walmart-sales-data

Project Overview

This project focuses on analyzing Walmart’s sales data to uncover insights into branch performance, product trends, and customer behavior. The primary goal is to improve sales strategies and optimize product offerings through data-driven insights. The dataset was sourced from the Kaggle Walmart Sales Forecasting Competition, which provides historical sales data from 45 Walmart stores located across different regions.

Objective:

    Understand the sales performance of different branches and products.
    Analyze customer behavior to identify key buying patterns and segment profitability.
    Evaluate the impact of marketing events, such as holiday promotions, on sales performance.

Dataset Overview

The dataset contains sales transaction details from three Walmart branches located in Mandalay, Yangon, and Naypyitaw. It has 17 columns and 1000 rows, each describing a sale made by customers.

Columns:

    invoice_id: Invoice ID for the sale (VARCHAR)
    branch: Store branch where the sale occurred (VARCHAR)
    city: City of the branch (VARCHAR)
    customer_type: Type of customer (e.g., new, returning) (VARCHAR)
    gender: Gender of the customer (VARCHAR)
    product_line: Category of the product sold (VARCHAR)
    unit_price: Price per unit of the product (DECIMAL)
    quantity: Quantity of items sold (INT)
    VAT: Value-added tax applied (FLOAT)
    total: Total cost including VAT (DECIMAL)
    date: Date of the sale (DATE)
    time: Time of sale (TIMESTAMP)
    payment_method: Method of payment (DECIMAL)
    cogs: Cost of Goods Sold (DECIMAL)
    gross_margin_percentage: Gross margin percentage (FLOAT)
    gross_income: Gross income from the sale (DECIMAL)
    rating: Customer rating for the purchase (FLOAT)

Analysis Focus

    Product Analysis: Evaluate the performance of different product lines and identify opportunities for improvement.
    Sales Analysis: Identify sales trends and the impact of different strategies on revenue growth.
    Customer Analysis: Segment customers based on their purchase behavior and assess the profitability of each group.

Approach

    Data Wrangling:
        Clean the dataset by handling missing or null values.
        Ensure data integrity by removing or replacing invalid entries.
    Feature Engineering:
        Create new columns such as time_of_day (Morning, Afternoon, Evening), day_name (Day of the week), and month_name to gain insights into sales patterns by time.
    Exploratory Data Analysis (EDA):
        Perform descriptive statistics to understand sales trends and patterns.
        Visualize key metrics, such as revenue by month, sales per product line, and customer segments.

Key Questions to Answer

    Sales Trends:
        Which product lines generate the most revenue?
        What month has the highest sales and COGS (Cost of Goods Sold)?
        Which branches outperform others in sales volume and profit margins?

    Customer Insights:
        What is the most common customer type (e.g., new vs. returning)?
        Which customer segment contributes the most to VAT and overall revenue?
        How does gender influence purchase behavior?

    Product Performance:
        What product line has the highest rating from customers?
        Which product line is considered "Good" (above average sales) or "Bad" (below average sales)?

Revenue & Profit Calculations

    COGS = unit_price * quantity
    VAT = 5% of COGS
    Total Sales (Gross Sales) = VAT + COGS
    Gross Income (Gross Profit) = Total Sales - COGS
    Gross Margin Percentage = (Gross Income / Total Sales) * 100
