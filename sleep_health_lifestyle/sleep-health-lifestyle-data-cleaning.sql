# Sleep Health and Data Project (Data Cleaning)

SELECT * FROM sleep_health_and_lifestyle_dataset;

# I immediately noticed an inconsistency where BMI Category has fields that list 'Normal' and 'Normal Weight'
Select *
FROM sleep_health_and_lifestyle_dataset
WHERE TRIM(`BMI Category`) = 'Normal Weight'
;

#To standardize to Normal, I update the table, accounting for possible leading/trailing spaces. 
-- Ran above command again and confirmed success - no results
UPDATE sleep_health_and_lifestyle_dataset
SET `BMI Category` = TRIM('Normal')
WHERE TRIM(`BMI Category`) = 'Normal Weight'
;

#I confirmed there are no Person IDs with multiple records to investigate further.
SELECT `Person ID`, COUNT(*) AS record_count
FROM sleep_health_and_lifestyle_dataset
GROUP BY `Person ID`
HAVING COUNT(*) > 1;

#Return names of string columns to address possible leading/trailing spaces.
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sleep_health_and_lifestyle'
  AND TABLE_NAME = 'sleep_health_and_lifestyle_dataset'
  AND DATA_TYPE IN ('varchar', 'char', 'text', 'mediumtext', 'longtext');
  
# No rows were affected, indicating no leading/trailing spaces. 
UPDATE sleep_health_and_lifestyle_dataset
SET
	`Blood Pressure` = TRIM(`Blood Pressure`),
	`BMI Category` = TRIM(`BMI Category`),
	`Gender` = TRIM(`Gender`),
	`Occupation` = TRIM(`Occupation`),
	`Sleep Disorder` = TRIM(`Sleep Disorder`)
;

# I confirm that no fields have differences in original length and length upon a trim to double check once again.
-- WHERE clause filters for rows with length differences (indicating spaces)
	SELECT
    `Blood Pressure`,
    LENGTH(`Blood Pressure`) AS original_bp_length,
    LENGTH(TRIM(`Blood Pressure`)) AS trimmed_bp_length,
    `BMI Category`,
    LENGTH(`BMI Category`) AS original_bmi_length,
    LENGTH(TRIM(`BMI Category`)) AS trimmed_bmi_length,
    `Gender`,
    LENGTH(`Gender`) AS original_gender_length,
    LENGTH(TRIM(`Gender`)) AS trimmed_gender_length,
    `Occupation`,
    LENGTH(`Occupation`) AS original_occupation_length,
    LENGTH(TRIM(`Occupation`)) AS trimmed_occupation_length,
    `Sleep Disorder`,
    LENGTH(`Sleep Disorder`) AS original_sleep_disorder_length,
    LENGTH(TRIM(`Sleep Disorder`)) AS trimmed_sleep_disorder_length
FROM
    sleep_health_and_lifestyle_dataset
WHERE
    LENGTH(`Blood Pressure`) <> LENGTH(TRIM(`Blood Pressure`)) OR
    LENGTH(`BMI Category`) <> LENGTH(TRIM(`BMI Category`)) OR
    LENGTH(`Gender`) <> LENGTH(TRIM(`Gender`)) OR
    LENGTH(`Occupation`) <> LENGTH(TRIM(`Occupation`)) OR
    LENGTH(`Sleep Disorder`) <> LENGTH(TRIM(`Sleep Disorder`));
  
