# Data portfolio

# Objective

To Investigate growth of Anime throughout the year of 2023

## Data Source

### What data is needed to achieve our objective? 

We need data on the top Anime ratings from 2023 that includes: 

- Anime names
- The studios their made by
- Amount of times they've been favourited
- The score rating 

Wheres the data coming from - [Kaggle](https://www.kaggle.com/datasets/dbdmobile/myanimelist-dataset)


### 1. What are the top 7 most liked Anime studios?

| Rank | Studio Name          | Favourites (K) |
|------|----------------------|----------------|
| 1    | Madhouse             | 964            |
| 2    | Pierrot              | 500            |
| 3    | Sunrise              | 461            |
| 4    | Toei Animation       | 367            |
| 5    | J.C.Staff            | 344            |
| 6    | TMS Entertainment    | 185            |
| 7    | OLM                  | 71             |


### 2. What are the top 5 most prevailing forms of source material to produce an anime?

| Rank | Source               | No of Anime (M)|
|------|----------------------|----------------|
| 1    | Original             | 79             |
| 2    | Manga                | 68             |
| 3    | Light Novel          | 22             |
| 4    | Unknown              | 20             |
| 5    | Novel                | 13             |


## Tools

| Tool     | Purpose                                               |
|----------|-------------------------------------------------------|
| Excel    | Exploring the data                                    |
| Power BI | Cleaning, testing, and analyzing the data             |
| SQL      | Visualizing the data via interactive dashboards       |
| Github   | Hosting the project documentation and version control |

# Development

## Psuedocode

### What the general approach in creating this solution from start to finish?

1. Get the data
2. Explore the data in Excel
3. Load the data into SQL Server
4. Clean the data with SQL
5. Test the data with SQL
6. Visualize the data in Power BI
7. Generate the findings based on the insights
8. Publish the data to GitHub Pages

## Initial observations

This is the stage where you have a scan of what's in the data, errors, inconcsistencies, bugs, weird and corrupted characters etc

- There were various columns that can be used in this analysis effective therefore there is little need to contact the client for more data.
- The third column contained the other name field which was in a different language. It will need to be confirmed if this is necessary so it can be dealt with.
- We have more data than we need, so some of these columns would need to be removed.

## Data cleaning

What do we expect the clean data to look like? (What should it contain? What contraints should we apply to it?)
The aim is to refine our dataset to ensure it is structured and ready for analysis.

The cleaned data should meet the following criteria and constraints:

- Only relevant columns should be retained.
- All data types should be appropriate for the contents of each column.
- No column should contain null values, indicating complete data for all records.

Below is a table outlining the constraints on our cleaned dataset:

| Property     | Description |
|--------------|-------------|
|No of Columns | 13          |

And here is a tabular representation of the expected schema for the clean data:

| Column Name     | Data Type | Nullable |
|-----------------|-----------|----------|
| anime_id        | INT       | NO       | 
| Name            | VARCHAR   | NO       |
| Score           | FLOAT     | NO       |
| Genres          | VARCHAR   | NO       |
| Type            | VARCHAR   | NO       |
| Aired           | VARCHAR   | NO       |
| Studios         | VARCHAR   | NO       |
| Source          | VARCHAR   | NO       |
| Rank            | INT       | NO       | 
| Popularity      | NCHAR     | NO       | 
| Favorites       | INT       | NO       |
| Scored_By       | INT       | NO       |
| Members         | INT       | NO       |

### What steps are needed to clean and shape the data into the desired format?

1. Remove unnecessary columns by only selecting the ones you need
2. Remove Entries with NULL in the field
3. Change incorrect data types

## Transform Data

First I extracted the required columns and removed any NULL values present

```
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

```

Using the below code I viewed the data types of each of the columns

```
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'anime-dataset-2023'

```

After confirming the columns with incorrect data types and used the below code to change them

```
ALTER TABLE [dbo].[anime-dataset-2023]
ALTER COLUMN Episodes INTEGER

```

## Create the SQL view

```
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

```

# Testing

## Column Count Check

### SQL Query

```
SELECT COUNT(*) AS Column_count 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'view_anime_dataset_2023'

```
### Output

![Column count](https://github.com/Stephen-I/Stephen-I.github.io/blob/main/Assets/Images/column%20count.png)

## Data Type Check

### SQL Query

```
SELECT 
COLUMN_NAME,
 DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'view_anime_dataset_2023'

```

### Output

![Data Type Check](https://github.com/Stephen-I/Stephen-I.github.io/blob/main/Assets/Images/Data%20type%20check.png)

## Duplicate Check

### SQL Query

```
SELECT 
Name,
COUNT(*) as duplicate_count
FROM view_anime_dataset_2023
GROUP BY Name
HAVING COUNT(*) > 1

```
### Output

![Duplicate Check](https://github.com/Stephen-I/Stephen-I.github.io/blob/main/Assets/Images/Duplicate%20check.png)


# Visualisation

### What does the Dashboard look like?

![Anime Dashboard](https://github.com/Stephen-I/Stephen-I.github.io/blob/main/Assets/Images/Anime%20dashboard.png)

This shows various data points that explain the relationships different Anime's, the studios that produced them and public opinion on both.
