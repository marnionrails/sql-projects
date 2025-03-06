# World Life Expectancy Project (Data Cleaning)


SELECT * 
FROM world_life_expectancy
;

# First Step: remove duplicate country/year combos

SELECT Country, Year, CONCAT(Country, Year), COUNT(CONCAT(Country, Year))
FROM world_life_expectancy
GROUP BY Country, Year, CONCAT(Country, Year)
HAVING COUNT(CONCAT(Country, Year)) > 1
;

# Find Country/year combos with multiple rows
SELECT *
FROM (
	SELECT Row_ID, 
	CONCAT(Country, Year),
	ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_Num
	FROM world_life_expectancy
    ) AS row_table
WHERE Row_Num > 1
;

# Delete Duplicates
DELETE FROM world_life_expectancy
WHERE 
	Row_ID IN (
    SELECT Row_ID
FROM (
	SELECT Row_ID,
    CONCAT(Country, Year),
    ROW_NUMBER() OVER( PARTITION BY CONCAT(Country, Year) ORDER BY CONCAT(Country, Year)) as Row_Num
    FROM world_life_expectancy
    ) As Row_table
WHERE Row_Num > 1
)
;

# Fix blank fields for Country Status

SELECT * 
FROM world_life_expectancy
WHERE Status = ''
;

# Find the possible Statuses -- Developed and Developing
SELECT DISTINCT(Status)
FROM world_life_expectancy
WHERE Status <> ''
;

# Find the distinct Countries where Status is '' as those need to be populated
SELECT DISTINCT(Country)
FROM world_life_expectancy
WHERE Status = 'Developing'
;

# This command fails
UPDATE world_life_expectancy
SET Status = 'Developing'
WHERE Country IN (SELECT DISTINCT(Country)
				FROM world_life_expectancy
				WHERE Status = 'Developing');
 
# Perform a self join with the countries that have black records and developing records
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developing'
;

# Check for any remaining blank statuses --- we get United States of America
SELECT *
From world_life_expectancy
WHERE Status = ''
;

# We confirm United States of America is indeed, recorded as a developed country. We need to fill in the blank record to reflect it.
SELECT *
FROM world_life_expectancy
WHERE Country = 'United States of America'
;

# Update black Status field for US to developed (Ran command above to double check!)
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status = 'Developed'
;

# Display Life records where Life expectancy is left blank. We get Albania and Afghanistan in 2018
SELECT * 
FROM world_life_expectancy
WHERE `Life expectancy` = '';
;

#The trend of life expectancy increases through the years, so we can fill in the blanks by averaging the values in 2017 and 2019
SELECT t1.Country, t1.Year, t1.`Life expectancy`,
t2.Country, t2.Year, t2.`Life expectancy`,
t3.Country, t3.Year, t3.`Life expectancy`,
ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
	AND t1.Year = t3.Year + 1
WHERE t1.`Life expectancy` = ''
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
	ON t1.Country = t2.Country
    AND t1.Year = t2.Year - 1
JOIN world_life_expectancy t3
	ON t1.Country = t3.Country
	AND t1.Year = t3.Year + 1
SET t1.`life expectancy` = ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = ''
;