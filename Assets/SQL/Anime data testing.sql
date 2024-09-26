/*

# Data quality test

1. The data needs 13 fields(column count test) .. passed
2. The Name column must be in VARCHAR format (Data type check) .. passed
3. Each record must be unique (duplicate count check) .. passed

column count - 13

Data types

Anime_id = INT
Name = VARCHAR
Score = FLOAT
Genres = VARCHAR
Type = VARCHAR 
Aired = VARCHAR
Studios = VARCHAR
Source = VARCHAR
Rank = INT
Popularity = NCHAR
Favorites = INT
Scored_By = INT 
Members = INT

Duplicate = 0

*/
-- 1. Column count check

SELECT COUNT(*) AS Column_count 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'view_anime_dataset_2023'

-- 2. Data type check

SELECT 
COLUMN_NAME,
 DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'view_anime_dataset_2023'

--3. Duplicate check

SELECT 
Name,
COUNT(*) as duplicate_count
FROM view_anime_dataset_2023
GROUP BY Name
HAVING COUNT(*) > 1