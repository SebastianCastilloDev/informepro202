SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
alter PROCEDURE SP3
AS
BEGIN
	

UPDATE peliculas
SET sinopsis = trim(REPLACE(sinopsis, '\"', ''))
WHERE CHARINDEX('\"', sinopsis) > 0;
UPDATE peliculas
SET titulo = trim(REPLACE(titulo, '\"', ''))
WHERE CHARINDEX('\"', titulo) > 0;
UPDATE peliculas
SET imdb_id = trim(REPLACE(imdb_id, '\"', ''))
WHERE CHARINDEX('\"', imdb_id) > 0;
UPDATE peliculas
SET sinopsis = trim(REPLACE(sinopsis, '\"', ''))
WHERE CHARINDEX('\"', sinopsis) > 0;
UPDATE peliculas
SET tagline = trim(REPLACE(tagline, '\"', ''))
WHERE CHARINDEX('\"', tagline) > 0;
END


