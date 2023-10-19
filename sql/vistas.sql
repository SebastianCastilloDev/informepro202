-- Cuantas peliculas tenemos disponibles?
create view numeroPeliculas
as
select count(id) as cuenta from pelicula

-- Que idiomas tenemos disponibles?
create view idiomasDisponibles
as
select idioma from idiomas_disponibles

-- Con que compañias productoras contamos?
create view peliculasReinoUnido
as
select productora from companias_productoras



-- Que peliculas fueron hechas en United Kingdom?
create view peliculasUnitedKingdom
as
SELECT pelicula.titulo, pelicula.duracion
FROM pelicula CROSS JOIN
paises_productores
where paises_productores.pais = 'United Kingdom'



-- Que peliculas de accion fueron lanzadas despues del 2010 y son de genero accion
create view peliculas2010HastaHoyAccion
as
SELECT pelicula.titulo, pelicula.fecha_lanzamiento
FROM pelicula 
INNER JOIN
	pelicula_genero
	ON pelicula.id = pelicula_genero.idPelicula 
INNER JOIN
	generos 
	ON pelicula_genero.idGenero = generos.idGenero
WHERE generos.genero = 'Action'
AND YEAR(pelicula.fecha_lanzamiento) > 2010



-- ver Duracion de las peliculas en formato  horas : minutos
create view peliculasHorasMinutos
as
select titulo, DuracionHM = 
case
	when duracion < 60 then cast(duracion as varchar) + ' minutos'
	else cast(FLOOR(duracion/60) as varchar) + ' horas  ' + cast((duracion%60) as varchar) + ' minutos'
end
from peliculas;



// utilizacion

select * from numeroPeliculas
select * from idiomasDisponibles
select * from peliculas2010HastaHoyAccion
select * from peliculasHorasMinutos
select * from peliculasUnitedKingdom