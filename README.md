# Informe Bases de datos PRO202

### Integrantes:
  * Álvaro Véliz
  * Cristóbal Storme
  * Monserrat Liberona
  * Sebastián Castillo

## Introducción

Se nos ha encargado la tarea de resolver un problema asociado a bases de datos, para ello hemos obtenido un archivo al azar del sitio web https://kaggle.com. 

Para la presentación y explicacion de los mecanismos utilizados en la elaboración de la solución, utilizaremos el lenguaje TRANSACT-SQL

El archivo tiene formato csv, con 23 columnas, las cuales se indican a continuacion.

```sql
create table peliculas(  
	id int primary key,  
	titulo varchar(100),
	votacion_promedio float,
	votacion_recuento int,
	estado varchar(15),
	fecha_lanzamiento varchar(12),
	ingresos bigint,
	duracion int,
	adult bit,
	ruta_backdrop varchar(500),
	presupuesto bigint,
	pagina_web varchar(500),
	imdb_id varchar(50),
	idioma_original varchar(200),
	titulo_original varchar(1000),
	sinopsis varchar(2000),
	popularidad varchar(10),
	ruta_poster varchar(200), 
	tagline varchar(500),
	generos varchar(300),
	compañias_productoras varchar(1000),
	paises_productores varchar(500),
	idiomas_disponibles varchar(500)
)
```

al realizar la consulta
```sql
SELECT TOP 1 * FROM peliculas
```
obtenemos el siguiente resultado.
```
11	
Star Wars	
8,204	
19155
Released
1977-05-25
775398007
121
0	
/zqkmTXzjkAgXmEWLRsY4UpTWCeo.jpg	
11000000	
http://www.starwars.com/films/star-wars-episode-iv-a-new-hope	tt0076759	
en	
Star Wars	
Princess Leia is captured and held hostage by the evil Imperial forces in their effort to take over the galactic Empire. Venturesome Luke Skywalker and dashing captain Han Solo team together with the loveable robot duo R2-D2 and C-3PO to rescue the beautiful princess and restore peace and justice in the Empire.	
88.559	
/6FfCtAuVAW8XJjZ7eWeLibRLWTw.jpg	
\"A long time ago in a galaxy far, far away...\"	
\"Adventure, Action, Science Fiction\"	
\"Lucasfilm Ltd., 20th Century Fox\"	
United States of America	
English
```

Si observamos las antepenúltimas filas vemos que tenemos valores separados por coma y tambien un conjunto de caracteres \\\" , que deseamos eliminar.

## Modelamiento de datos

### Modelo entidad relación.

El modelo entidad relación que describe nuestros datos es el que se muestra a continuación.  
  
![Modelo entidad relación](/modelo-entidad-relacion.png)  

### Diagrama físico

El diagrama físico que describe nuestros datos es el siguiente.  

![Diagrama físico](/diagrama-fisico.png)

# Desarrollo de la solución

Supongamos el siguiente escenario. Una empresa de cine requiere incorporar en sus registros un conjunto de datos existentes acerca de películas. Además la empresa quiere poder implementar esos registros en la base de datos de producción.

## Solución propuesta

Nuestro equipo ha decidido que es importante analizar y descomponer la estructura de los datos de origen, la cual ya ha sido descrita. Para ello nos hemos propuesto la elaboración de un conjunto de procedimientos almacenados y vistas.

Los procedimientos almacenados se encargaran de descomponer la estructura de la base de datos e ingresar los datos en las nuevas tablas.

Las vistas se encargarán de responder y generar las consultas requeridas por la empresa.

De esta forma podremos disponer de una base de datos con una estructura habilitada para producción.

Para elaborar la solución el equipo ha propuesto la utilización de un conjunto de funciones, estructuras y instrucciones internas del lenguaje que resultarán utiles.

* Funciones
    * LEN
    * REPLACE
    * TRIM
    * SUBSTRING
    * CHARINDEX
    * STRING_SPLIT
* Estructuras del lenguaje
    * IF
    * CASE
* Instrucciones
    * CROSS APPLY  
    
Además nos hemos propuesto la siguiente secuencia de pasos para lograr nuestro objetivo.

1. **Paso 1:** Descomponer el archivo CSV original e insertar valores en la base de datos e insertarlos en la tabla **peliculas**
2. **Paso 2:** Crear la estructura de tablas necesaria reflejada en el diagrama físico.
3. **Paso 3:** Descomponer los valores de filas de la tabla **peliculas** que sean compuestos, es decir que tengan varios valores separados por comas, ademas de eliminar caracteres indeseados.

A continuación explicaremos las bases y conceptos con los cuales hemos construído la solución.

### Paso 1:

Para llevar a cabo la tarea de realizar la primera separacion de valores, nos propusimos desarrollar un código en el lenguaje de programación C#, el cual puede revisar en este [enlace](https://gist.github.com/SebastianCastilloDev/f8fc801beda3f703b1e0ad25629ca864#file-lectorarchivoscsv-cs)

### Paso 2:

Analicemos la siguiente cadena de caracteres
```
\"Adventure, Fantasy, Action\"
```

Podemos ver que tenemos valores separados por comas, que irán en este caso hacia la tabla **idiomas_disponibles**.

Nos interesa primeramente remover los caracteres '\\\"', para ello, nos valdremos de la funcion SUBSTRING y LEN.
```sql
DECLARE @miCadena VARCHAR(MAX);
SET @miCadena = '\"Adventure, Fantasy,Action\"'
PRINT SUBSTRING(@miCadena, 3, LEN(@miCadena) - 4)
```
El paso siguiente será separar nuestros valores, considerando como carácter separador, la coma: ' , '. Para ello utilizaremos la función STRING_SPLIT, la cual toma una cadena y devuelve una consulta con cada elemento. En el siguiente ejemplo mostramos como podemos separar la cadena @miCadena, de acuerdo a los valores contenidos entre *comas*.
```sql
DECLARE @miCadena VARCHAR(MAX);
SET @miCadena = 'Adventure, Fantasy, Action'
SELECT value FROM STRING_SPLIT(@miCadena, ',') --devuelve una consulta con cada elemento en una fila. Cada valor se almacena en value
```
Esto nos devuelve los valores contenidos entre los caracteres de *comas*, pero no toma en cuenta si es que existen caracteres de *espacio*, al inicio o al final de cada elemento, para ello nos valdremos de la función TRIM.
```sql
DECLARE @miCadena VARCHAR(MAX);
SET @miCadena = '      Adventure      '
SELECT TRIM(@miCadena) -- 'Adventure'
```
La función TRIM nos devolverá la cadena sin espacios en blanco,  al inicio y al final de la cadena. También se hace uso de las funciones RTRIM y LTRIM, las cuales eliminan los espacios a la derecha y a la izquierda respectivamente.

Otra función interesante es CHARINDEX, la cual me devuelve un entero, a partir de 1, con la *posición de la primera coincidencia* de un caracter que estemos buscando.
```sql
DECLARE @miCadena VARCHAR(MAX);
SET @miCadena = 'Adventure'
SELECT CHARINDEX('e',@miCadena) -- 4
```

Tambien disponemos de estructuras de control tales como IF ELSE, o CASE. Se debe tener en cuenta que no se pueden utilizar estructuras IF ELSE dentro de la instrucción SELECT.
```sql
DECLARE @caracterABuscar AS char
DECLARE @cadena AS varchar(100)

SET @caracterABuscar = ','
SET @cadena = 'Acá, viene una coma'

SELECT @cadena

IF @cadena LIKE '%,%' 
	SELECT @cadena, 'tiene coma' 
ELSE 
	SELECT @cadena, 'no tiene coma'
```
A continuación veremos un ejemplo de la estructura de control CASE.

```sql
SELECT id, generos, generosPeliculas = 
CASE 
	WHEN generos LIKE '%,%'
        THEN TRIM(SUBSTRING(generos, 3, LEN(generos) - 4))
	ELSE generos
END
FROM peliculas
```
Al realizar esta consulta, nos devuelve el siguiente resultado.

![Diagrama físico](/consultacase.png)

## Soluciones desarrolladas.

A través de la combinación de estos conceptos confeccionamos una serie de algoritmos en TRANSACT-SQL que nos permiten llevar los datos de un archivo csv de origen, a una base de datos normalizada a su 3FN disponible para ser implementada en producción.



