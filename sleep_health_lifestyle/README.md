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
  **Occupation and Sleep Quality**:
     - **Female Engineers in Their 50s**: This group reported consistently low stress levels (3 out of 10), normal BMI, high sleep quality (9 out of 10), and no sleep disorders. They maintained a healthy heart rate (65 bpm) and blood pressure (125/80), with an average of 5000 steps per day. These findings suggest a generally healthier profile compared to their nursing counterparts.
    - **Female Nurses in Their 50s**: While stress levels, sleep quality, and duration improve in their later 50s, 89% still reported having sleep apnea, and all had a blood pressure of 140/95, with 98% classified as overweight. Despite taking an average of 7000 to 10000 steps per day, there is not necessarily a correlation between the number of steps and overall health, as indicated by persistent health issues.
    - **Comparison with Younger Female Nurses**: Among younger female nurses (under 50), 64% reported having sleep apnea. This indicates an increase in sleep apnea prevalence with age, possibly exacerbated by cumulative occupational stress.

## How to Access the SQL Files
- [Data Cleaning SQL](./sleep-health-lifestyle-data-cleaning.sql)
- [Exploratory Data Analysis SQL](./path/to/exploratory-data-analysis.sql)

### Implications

These findings suggest that while stress levels, sleep quality, and duration may improve in the later 50s, the long-term effects of occupational stress and lifestyle factors can lead to significant health issues, such as high blood pressure and sleep apnea, particularly among female nurses. The lack of correlation between the number of steps and overall health highlights the complexity of health outcomes and the need for comprehensive health strategies that address multiple factors.

This analysis highlights differences in health outcomes among female nurses and engineers in their 50s. While nurses reported higher rates of sleep apnea and high blood pressure, these findings underscore the importance of addressing occupational stress and promoting comprehensive health strategies. By understanding these trends, we can work towards creating healthier work environments for all.

## Future Work

- Further analysis on the impact of specific lifestyle changes on sleep quality.
- Exploration of additional datasets to broaden the scope of the analysis.
