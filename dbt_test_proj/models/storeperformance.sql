{{ config(materialized='table') }}  
SELECT
    OS.store_id,
    SUM(OFACT.Revenue) AS ActualSales,
    SUM(ST.SalesTarget) AS TargetSales
FROM
    {{ ref('orders_stg') }} OS
JOIN
    {{ ref('orders_fact') }} OFACT ON OS.OrderID = OFACT.OrderID
JOIN
    {{ ref('salestargets') }} ST ON ST.StoreID = OS.store_id
GROUP BY 1