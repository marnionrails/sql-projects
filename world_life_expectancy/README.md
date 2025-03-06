# World Life Expectancy Data Cleaning

This project involves cleaning a dataset of world life expectancy data using MySQL Server. The primary goal was to prepare the dataset for accurate analysis by addressing data quality issues such as duplicates, missing values, and inconsistencies.

## Project Objectives

- **Remove Duplicates**: Identify and remove duplicate records based on country and year combinations to ensure data integrity.
- **Handle Missing Status Values**: Fill in missing 'Status' fields, which indicate whether a country is 'Developed' or 'Developing', using self-joins.
- **Fill Missing Life Expectancy Values**: Use trend-based averaging to fill in gaps in life expectancy data, following the trend of increasing life expectancy over time.

## Techniques Used

- SQL functions such as `COALESCE` and `CASE` statements to handle null values and standardize data formats.
- Window functions to identify and remove duplicate records.
- Self-joins to fill in missing data based on existing records.

## Outcomes

- Improved dataset accuracy, enabling more reliable insights and visualizations.

## How to Access the SQL File

You can view the SQL script used for this project by clicking [here](./data-cleaning.sql).
