/*
All TV Shows
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
Top 10 TV Shows with highest ratings.
*/
SELECT TOP 10
    [Title], 
    [Vote_Count],
    [Rating],
    [Category]
FROM IMDB_Top250_TVshows
ORDER BY [Rating] DESC

/*
TV Shows whose vote counts are above average and below average.
*/
SELECT 
    [Title],
    [Vote_Count]
FROM IMDB_Top250_Tvshows
WHERE [Vote_Count] > (Select AVG(Vote_Count) FROM IMDB_Top250_Tvshows)
ORDER BY [Vote_Count] DESC

/*
Number of TV Shows for each Content_Rating 
*/
SELECT [Content_Rating], COUNT([Content_Rating]) AS 'Number_Of_Shows'
FROM IMDB_Top250_Tvshows
GROUP BY [Content_Rating]
ORDER BY 2 DESC