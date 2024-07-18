/*
The dataset is based on the Top 250 TV Shows on IMDb. The votes were placed by IMDb users.
*/

/*

*/
SELECT *
FROM IMDB_Top250_Tvshows

/*
Tv Series that are not mini series
*/
SELECT COUNT(Title) 
FROM IMDB_Top250_Tvshows
WHERE [Category] = 'TV Series';

/*
Basic Aggregation
*/

SELECT COUNT(Vote_Count) as 'Vote_Count',
    MIN(Year_Start) as 'Earliest_Year',
    MAX(Year_Start) as 'Latest_Year'
FROM IMDB_Top250_Tvshows

/*
Top 10 TV Shows with highest ratings. 
This indicates which TV Show is highly acclaimed by the viewers.
*/
SELECT TOP 10
    [Title], 
    [Vote_Count],
    [Rating]
FROM IMDB_Top250_TVshows
ORDER BY [Rating] DESC

/*
TV Shows whose vote counts are above average
This indicates which TV Show is the most viewed by IMDb users
*/
SELECT 
    [Title],
    [Vote_Count]
FROM IMDB_Top250_Tvshows
WHERE [Vote_Count] > (Select AVG(Vote_Count) FROM IMDB_Top250_Tvshows)
ORDER BY [Vote_Count] DESC

/*
TV Shows whose vote counts are below average.
*/
SELECT 
    [Title],
    [Vote_Count],
    [Rating]
FROM IMDB_Top250_Tvshows
WHERE [Vote_Count] < (Select AVG(Vote_Count) FROM IMDB_Top250_Tvshows)
ORDER BY [Vote_Count] DESC

/*
Number of TV Shows for each Content_Rating
*/
SELECT [Content_Rating], COUNT([Content_Rating]) AS 'Number_Of_Shows'
FROM IMDB_Top250_Tvshows
GROUP BY [Content_Rating]
ORDER BY 2 DESC