
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE SP5
AS
BEGIN

if exists (select * from pelicula_genero)
begin
    delete from pelicula_genero;
end
select distinct value
into #temp_pelicula_genero
from peliculas
cross apply string_split(replace(generos, '\"', ''), ',')
where generos is not null and generos != '';
insert into pelicula_genero(idGenero, idPelicula)
select i.idGenero, p.id
from peliculas p
join #temp_pelicula_genero t on charindex(t.value, replace(p.generos, '\"', '')) > 0
join generos i on t.value = i.genero;
drop table #temp_pelicula_genero;

if exists(select * from pelicula_idiomas)
	delete from pelicula_compania
select distinct value
into #temp_pelicula_idiomas
from peliculas
cross apply string_split(replace(idiomas_disponibles, '\"', ''), ',')
where idiomas_disponibles is not null and idiomas_disponibles != '';
insert into pelicula_idiomas(idIdiomas_disponibles, idPelicula)
select i.idIdiomas_disponibles, p.id
from peliculas as p
join #temp_pelicula_idiomas as t on charindex(t.value, replace(p.idiomas_disponibles, '\"', '')) > 0
join idiomas_disponibles as i on t.value = i.idioma;
drop table #temp_pelicula_idiomas;

if exists (select * from pelicula_compania)
    delete from pelicula_compania;

select distinct value
into #temp_pelicula_compañia
from peliculas
cross apply string_split(replace(compañias_productoras, '\"', ''), ',')
where compañias_productoras is not null and compañias_productoras != '';
insert into pelicula_compania(idCompania_productora, idPelicula)
select i.idCompania_productora, p.id
from peliculas as p
join #temp_pelicula_compañia t on charindex(t.value, replace(p.compañias_productoras, '\"', '')) > 0
join companias_productoras as i on t.value = i.productora;
drop table #temp_pelicula_compañia;

if exists (select * from pelicula_paises_productores)
begin
    delete from pelicula_paises_productores;
end
select distinct value
into #temp_pelicula_pais
from peliculas
cross apply string_split(replace(paises_productores, '\"', ''), ',')
where paises_productores is not null and paises_productores != '';
insert into pelicula_paises_productores(idPaises_productores, idPelicula)
select i.idpaises_productores, p.id
from peliculas p
join #temp_pelicula_pais t on charindex(t.value, replace(p.paises_productores, '\"', '')) > 0
join paises_productores i on t.value = i.pais;
drop table #temp_pelicula_pais;

END
GO
