--created a database called “Young – lives” 


USE master
GO
CREATE DATABASE young_lives



-- created a view using CREATE VIEW Statement and UNION ALL operator to combine the two countries and filter the missing values from the WHERE clause. At the same time, added an extra column as "country" using the ALTER TABLE function.

--Creating first view 'Child House Quality'

CREATE VIEW House_Qlt
AS
SELECT childid,round,ownhouse,hq,elecq,toiletq,drwaterq
FROM [dbo].[India]
WHERE round=2 AND ownhouse<>'' AND elecq<>'' AND toiletq<>'' AND drwaterq<>''
UNION ALL
SELECT childid,round,ownhouse,hq,elecq,toiletq,drwaterq
FROM [dbo].[Peru]
WHERE round=2 AND ownhouse<>'' AND elecq<>'' AND toiletq<>'' AND drwaterq<>''


--Adding the country column to the view

ALTER VIEW [dbo].[House_Qlt] AS
SELECT childid,round,ownhouse,hq,elecq,toiletq,drwaterq, ISNULL(country,'India') As country
FROM [dbo].[India]
WHERE round=2 AND ownhouse<>'' AND elecq<>'' AND toiletq<>'' AND drwaterq<>''
UNION ALL
SELECT childid,round,ownhouse,hq,elecq,toiletq,drwaterq, ISNULL(country,'Peru') As country
FROM [dbo].[Peru]
WHERE round=2 AND ownhouse<>'' AND elecq<>'' AND toiletq<>'' AND drwaterq<>''



SELECT *
FROM [dbo].[House_Qlt]