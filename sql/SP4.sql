-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE SP4
AS
BEGIN
	insert into 
		pelicula (id, titulo, votacion_promedio, votacion_recuento, fecha_lanzamiento,ingresos,duracion,adult,ruta_backdrop, presupuesto, pagina_web,imdb_id,idioma_original, titulo_original, sinopsis, popularidad, ruta_poster, tagline) 
	select 
		id, titulo, votacion_promedio, votacion_recuento, fecha_lanzamiento,ingresos,duracion,adult,ruta_backdrop, presupuesto, pagina_web,imdb_id,idioma_original, titulo_original, sinopsis, popularidad, ruta_poster, tagline
	from 
		peliculas



-- Llenar tablas companias_productoras, generos, idiomas_disponibles, paises_productores con valores unicos

declare @miTabla as table (
	id int identity,
	variable varchar(max)
)

-- Verificar si la tabla idiomas_disponibles contiene datos
if exists (select 1 from idiomas_disponibles)
begin
    -- Eliminar todos los registros de la tabla idiomas_disponibles
    delete from idiomas_disponibles;
end

insert into @miTabla (variable)
select value as variable
from (
    select case
        -- Primera versión: Separar y eliminar caracteres
        when idiomas_disponibles like '%,%'
        then trim(substring(idiomas_disponibles, 3, len(idiomas_disponibles) - 4))
        -- Segunda versión: Insertar directamente
        else idiomas_disponibles
    end as idiomas_disponibles
    from peliculas
) as Subquery
cross apply string_split(idiomas_disponibles, ',') as Split;

update @miTabla
set variable = LTRIM(RTRIM(variable));

insert into idiomas_disponibles (idioma)
select distinct variable from @miTabla

select * from idiomas_disponibles

---------------------------------------------------------------------------------------------------

--Lo mismo para los paises
delete from @miTabla


-- Verificar si la tabla idiomas_disponibles contiene datos
if exists (select 1 from paises_productores)
begin
    -- Eliminar todos los registros de la tabla idiomas_disponibles
    delete from paises_productores;
end

insert into @miTabla (variable)
select value as variable
from (
    select case
        -- Primera versión: Separar y eliminar caracteres
        when paises_productores like '%,%'
        then trim(substring(paises_productores, 3, len(paises_productores) - 4))
        -- Segunda versión: Insertar directamente
        else paises_productores
    end as paises_productores
    from peliculas
) as Subquery
cross apply string_split(paises_productores, ',') as Split;

update @miTabla
set variable = LTRIM(RTRIM(variable));

insert into paises_productores (pais)
select distinct variable from @miTabla

select * from paises_productores

---------------------------------------------------------------------------------------------------

-- compañias productoras
delete from @miTabla

-- Verificar si la tabla idiomas_disponibles contiene datos
if exists (select 1 from companias_productoras)
begin
    -- Eliminar todos los registros de la tabla idiomas_disponibles
    delete from companias_productoras;
end

insert into @miTabla (variable)
select value as variable
from (
    select case
        -- Primera versión: Separar y eliminar caracteres
        when compañias_productoras like '%,%'
        then trim(substring(compañias_productoras, 3, len(compañias_productoras) - 4))
        -- Segunda versión: Insertar directamente
        else compañias_productoras
    end as compañias_productoras
    from peliculas
) as Subquery
cross apply string_split(compañias_productoras, ',') as Split;

update @miTabla
set variable = LTRIM(RTRIM(variable));

insert into companias_productoras (productora)
select distinct variable from @miTabla

select * from companias_productoras

---------------------------------------------------------------------------------------------------

-- generos
delete from @miTabla
-- Verificar si la tabla idiomas_disponibles contiene datos
if exists (select 1 from generos)
begin
    -- Eliminar todos los registros de la tabla idiomas_disponibles
    delete from generos;
end

insert into @miTabla (variable)
select value as variable
from (
    select case
        -- Primera versión: Separar y eliminar caracteres
        when generos like '%,%'
        then trim(substring(generos, 3, len(generos) - 4))
        -- Segunda versión: Insertar directamente
        else generos
    end as generos
    from peliculas
) as Subquery
cross apply string_split(generos, ',') as Split;

--select * from @miTabla;
update @miTabla
set variable = LTRIM(RTRIM(variable));

insert into generos (genero)
select distinct variable from @miTabla

select * from generos

END
GO
