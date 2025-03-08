# Sleep, Health, and Lifestyle Analysis

This project involves both data cleaning and exploratory data analysis (EDA) of a dataset focused on sleep, health, and lifestyle using MySQL Server. The goal is to prepare the dataset for accurate analysis and uncover insights into how various factors such as gender, age, occupation, and lifestyle habits influence sleep quality and related health outcomes.

## Dataset Overview

The Sleep, Health, and Lifestyle Dataset comprises 400 rows and 13 columns, covering a wide range of variables related to sleep and daily habits. It includes details such as:

- Gender
- Age
- Occupation
- Sleep Duration
- Quality of Sleep
- Physical Activity Level
- Stress Levels
- BMI Category
- Blood Pressure
- Heart Rate
- Daily Steps
- Presence or Absence of Sleep Disorders

## Data Access

The dataset used in this project is publicly available on Kaggle and can be accessed via the following link:

- [Sleep, Health, and Lifestyle Dataset](https://www.kaggle.com/datasets/uom190346a/sleep-health-and-lifestyle-dataset)

Please ensure you comply with Kaggle's terms of use when downloading and using the dataset.

## Data Cleaning

- **Standardization**: Ensured consistency in the `BMI Category` field by standardizing entries from "Normal Weight" to "Normal". This step was crucial for maintaining uniformity in categorical data.
- **Trimming**: Applied the `TRIM()` function to remove leading and trailing spaces from key string fields, including `Blood Pressure`, `BMI Category`, `Gender`, `Occupation`, and `Sleep Disorder`. This was verified by comparing the original and trimmed lengths of each field.
- **Duplicate Check**: Conducted a check for duplicate records by verifying that no `Person ID` had multiple entries, ensuring data integrity.
- **Schema Inspection**: Queried the information schema to identify all string columns, ensuring comprehensive trimming across relevant fields.

## Exploratory Data Analysis

- **Objective**: Analyze trends and correlations between various factors and sleep quality, such as the impact of physical activity, stress levels, and BMI on sleep disorders.
- **Key Insights**:
  - [Insight 1: Placeholder for findings related to gender and sleep quality]
  - [Insight 2: Placeholder for findings related to occupation and sleep quality]
  - [Insight 3: Placeholder for findings on the relationship between BMI and sleep disorders]
  - [Insight 4: Placeholder for any other significant findings]

## How to Access the SQL Files
- [Data Cleaning SQL](./sleep-health-lifestyle-data-cleaning.sql)
- [Exploratory Data Analysis SQL](./path/to/exploratory-data-analysis.sql)

## Conclusion

The project aims to highlight important trends and correlations in sleep and health data, providing valuable insights into the factors that influence sleep quality. These insights can inform healthcare strategies and further research into improving sleep health.

## Future Work

- Further analysis on the impact of specific lifestyle changes on sleep quality.
- Exploration of additional datasets to broaden the scope of the analysis.
