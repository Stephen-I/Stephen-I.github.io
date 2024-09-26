USE Anime_db

/*

Data cleaning steps

1. Remove unnecessary columns by only selecting ones we need
2. Remove any NULL Values

*/


SELECT * FROM view_anime_dataset_2023

CREATE VIEW view_anime_dataset_2023 AS

SELECT
anime_id,
Name, 
Score,
Genres,
Type, 
Aired,
Studios,
Source,
Rank,
Popularity,
Favorites,
Scored_By,
Members
FROM [dbo].[anime-dataset-2023]
Where Score NOT Like 'NULL' AND Rank NOT LIKE 'NULL'


SELECT 
COLUMN_NAME,
 DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'anime-dataset-2023'

ALTER TABLE [dbo].[anime-dataset-2023]
ALTER COLUMN Episodes INTEGER