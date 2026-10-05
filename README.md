# Data Warehouse Projects

## Introduction

This project aims to build a data warehouse solution for an e-commerce company.

In this project, we designed a data pipeline that uses data from Customer Relationship Management (CRM) and Enterprise Resource Planning (ERP) systems as data sources. The data then undergoes the Extract, Transform, and Load (ETL) process in SQL server to prepare it for end-user consumption, as illustrated below.

<img width="885" height="547" alt="image" src="https://github.com/user-attachments/assets/14f77a0b-a651-4aed-95ad-96ebc7130d1f" />


1) Bronze Layer: Stores raw data as-is from the source systems. Data is ingested from CSV Files into SQL Server Database.
2) Silver Layer: This layer includes data cleansing, standardization, and normalization processes to prepare data for analysis.
3) Gold Layer: Houses business-ready data modeled into a star schema required for reporting and analytics.

## Data Flow
<img width="885" height="547" alt="Data Flow" src="https://github.com/user-attachments/assets/df9036cd-c55f-4279-a719-f51ce0a5d9a8" />

## Data Modeling
<img width="885" height="547" alt="Data Model" src="https://github.com/user-attachments/assets/b81e0121-017f-478a-b329-d9e0b6c1a9a0" />

## Tool Used
* SQL Server - for data storage, data manipulation, data transformation
* Draw io - Designing data architecture, models , flows and diagrams.

