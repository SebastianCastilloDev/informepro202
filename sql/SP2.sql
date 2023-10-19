-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP2
AS
BEGIN
	create table pelicula(
	id int primary key,
	titulo varchar(max),
	votacion_promedio float,
	votacion_recuento int,
	fecha_lanzamiento varchar(12),
	ingresos bigint,
	duracion int,
	adult bit,
	ruta_backdrop varchar(max),
	presupuesto bigint,
	pagina_web varchar(max),
	imdb_id varchar(max),
	idioma_original varchar(max),
	titulo_original varchar(max),
	sinopsis varchar(max),
	popularidad varchar(10),
	ruta_poster varchar(max),
	tagline varchar(max)
)

create table generos(
	idGenero int primary key identity,
	genero varchar(max) not null
)

create table companias_productoras(
	idCompania_productora int primary key identity,
	productora varchar(max) not null
)

create table paises_productores(
	idPaises_productores int primary key identity,
	pais varchar(max) not null
)
create table idiomas_disponibles(
	idIdiomas_disponibles int primary key identity,
	idioma varchar(max) not null
)

create table pelicula_genero(
	id int primary key identity,
	idGenero int references generos(idGenero) not null,
	idPelicula int references pelicula(id) not null
)

create table pelicula_compania(
	id int primary key identity,
	idCompania_productora int references companias_productoras(idCompania_productora) not null,
	idPelicula int references pelicula(id) not null
)

create table pelicula_paises_productores(
	id int primary key identity,
	idPaises_productores int references paises_productores(idPaises_productores) not null,
	idPelicula int references pelicula(id) not null
)

create table pelicula_idiomas(
	id int primary key identity,
	idIdiomas_disponibles int references idiomas_disponibles(idIdiomas_disponibles) not null,
	idPelicula int references pelicula(id) not null
)
END
GO
