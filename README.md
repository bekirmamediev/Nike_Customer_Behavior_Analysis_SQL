# Nike_Customer_Behavior_Analysis_SQL

## Project Overview

This project aims to analyze the purchasing behavior of customers across Nike Official and Nike Vintage business units. The analysis focuses on understanding key metrics such as total revenue, customer segmentation, revenue distribution by state, and order status summaries. These insights will help drive business decisions and improve customer engagement strategies.
Each question is answered using specific SQL queries, and the results are presented in a clear and structured manner.
An index.html file is included for easy navigation through the questions and their corresponding analyses.

## Objectives

1. Combine data from Nike Official and Nike Vintage business units.
2. Analyze top customers by total revenue and number of order items.
3. Segment customers based on their purchasing behavior.
4. Examine revenue distribution by state and the contribution of Nike Official.
5. Summarize order statuses by state and customer.

## Dataset overview:

This database contains data about the e-commerce business of Nike. The database includes four different tables that include information about online orders, products, and distribution of the products.
To connect database: postgres://Test:bQNxVzJL4g6u@ep-noisy-flower-846766.us-east-2.aws.neon.tech/SQL_2_3

## Tables

### Orders

| Column Name  | Data Type | Description                                            |
| ------------ | --------- | ------------------------------------------------------ |
| order_id     | text      | Unique identifier of the order                         |
| user_id      | text      | Unique identifier of the customer purchasing the order |
| status       | text      | Current status of the order                            |
| gender       | text      | Gender of the customer purchasing the order            |
| created_at   | date      | Date of when the order got created                     |
| returned_at  | date      | Date of when the order got returned                    |
| shipped_at   | date      | Date of when the order got shipped                     |
| delivered_at | date      | Date of when the order got delivered                   |

### Order Items

| Column Name   | Data Type | Description                                            |
| ------------- | --------- | ------------------------------------------------------ |
| order_item_id | text      | Unique identifier of the order item                    |
| order_id      | text      | Unique identifier of the order                         |
| user_id       | text      | Unique identifier of the customer purchasing the order |
| product_id    | text      | Unique identifier of the product                       |
| created_at    | date      | Date of when the order item got created                |
| shipped_at    | date      | Date of when the order item got shipped                |
| delivered_at  | date      | Date of when the order item got delivered              |
| returned_at   | date      | Date of when the order item got returned               |
| sale_price    | float     | The sales price of the product part of the order item  |

### Order Items Vintage

| Column Name   | Data Type | Description                                            |
| ------------- | --------- | ------------------------------------------------------ |
| order_item_id | text      | Unique identifier of the order item                    |
| order_id      | text      | Unique identifier of the order                         |
| user_id       | text      | Unique identifier of the customer purchasing the order |
| product_id    | text      | Unique identifier of the product                       |
| created_at    | date      | Date of when the order item got created                |
| shipped_at    | date      | Date of when the order item got shipped                |
| delivered_at  | date      | Date of when the order item got delivered              |
| returned_at   | date      | Date of when the order item got returned               |
| sale_price    | float     | The sales price of the product part of the order item  |

### Products

| Column Name            | Data Type | Description                                    |
| ---------------------- | --------- | ---------------------------------------------- |
| product_id             | text      | Unique identifier of the product               |
| cost                   | float     | The cost price of the product                  |
| category               | text      | The category that the product is part of       |
| product_name           | text      | Name of the product                            |
| retail_price           | text      | Retail price of the product without discount   |
| sku                    | text      | Stock keeping unit code for inventory manageme |
| distribution_center_id | text      | Unique identifier of the distribution center   |

### Distribution Centers

| Column Name            | Data Type | Description                                   |
| ---------------------- | --------- | --------------------------------------------- |
| distribution_center_id | text      | Unique identifier of the distribution center  |
| name                   | text      | Name of the distribution center               |
| latitude               | float     | Latitude of the distribution center location  |
| longitude              | float     | Longitude of the distribution center location |
