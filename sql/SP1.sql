
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE SP1
AS
BEGIN

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
	compa�ias_productoras varchar(1000),
	paises_productores varchar(500),
	idiomas_disponibles varchar(500)
)


INSERT INTO peliculas VALUES(27205, 'Inception', 8.364, 34495, 'Released', '2010-07-15', 825532764, 148, 0, '/8ZTVqvKDQ8emSGUEMjsS4yHAwrp.jpg', 160000000, 'https://www.warnerbros.com/movies/inception', 'tt1375666', 'en', 'Inception', '\"Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"\"inception\"\", the implantation of another person''s idea into a target''s subconscious.\"', 83.952, '/oYuLEt3zVCKq57qu2F8dT7NIa6f.jpg', 'Your mind is the scene of the crime.', '\"Action, Science Fiction, Adventure\"', '\"Legendary Pictures, Syncopy, Warner Bros. Pictures\"', '\"United Kingdom, United States of America\"', '\"English, French, Japanese, Swahili\"')
INSERT INTO peliculas VALUES(157336, 'Interstellar', 8.417, 32571, 'Released', '2014-11-05', 701729206, 169, 0, '/pbrkL804c8yAv3zBZR4QPEafpAR.jpg', 165000000, 'http://www.interstellarmovie.net/', 'tt0816692', 'en', 'Interstellar', 'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.', 140.241, '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 'Mankind was born on Earth. It was never meant to die here.', '\"Adventure, Drama, Science Fiction\"', '\"Legendary Pictures, Syncopy, Lynda Obst Productions\"', '\"United Kingdom, United States of America\"', 'English')
INSERT INTO peliculas VALUES(155, 'The Dark Knight', 8.512, 30619, 'Released', '2008-07-16', 1004558444, 152, 0, '/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg', 185000000, 'https://www.warnerbros.com/movies/dark-knight/', 'tt0468569', 'en', 'The Dark Knight', '\"Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.\"', 130.643, '/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 'Welcome to a world without rules.', '\"Drama, Action, Crime, Thriller\"', '\"DC Comics, Legendary Pictures, Syncopy, Isobel Griffiths, Warner Bros. Pictures\"', '\"United Kingdom, United States of America\"', '\"English, Mandarin\"')
INSERT INTO peliculas VALUES(19995, 'Avatar', 7.573, 29815, 'Released', '2009-12-15', 2923706026, 162, 0, '/vL5LR6WdxWPjLPFRLe133jXWsh5.jpg', 237000000, 'https://www.avatar.com/movies/avatar', 'tt0499549', 'en', 'Avatar', '\"In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission, but becomes torn between following orders and protecting an alien civilization.\"', 79.932, '/kyeqWdyUXW608qlYkRqosgbbJyK.jpg', 'Enter the world of Pandora.', '\"Action, Adventure, Fantasy, Science Fiction\"', '\"Dune Entertainment, Lightstorm Entertainment, 20th Century Fox, Ingenious Media\"', '\"United States of America, United Kingdom\"', '\"English, Spanish\"')
INSERT INTO peliculas VALUES(24428, 'The Avengers', 7.71, 29166, 'Released', '2012-04-25', 1518815515, 143, 0, '/9BBTo63ANSmhC4e6r62OJFuK2GL.jpg', 220000000, 'https://www.marvel.com/movies/the-avengers', 'tt0848228', 'en', 'The Avengers', '\"When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!\"', 98.082, '/RYMX2wcKCBAr24UyPD7xwmjaTn.jpg', 'Some assembly required.', '\"Science Fiction, Action, Adventure\"', 'Marvel Studios', 'United States of America', '\"English, Hindi, Russian\"')
INSERT INTO peliculas VALUES(293660, 'Deadpool', 7.606, 28894, 'Released', '2016-02-09', 783100000, 108, 0, '/en971MEXui9diirXlogOrPKmsEn.jpg', 58000000, 'https://www.20thcenturystudios.com/movies/deadpool', 'tt1431045', 'en', 'Deadpool', '\"The origin story of former Special Forces operative turned mercenary Wade Wilson, who, after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.\"', 72.735, '/zq8Cl3PNIDGU3iWNRoc5nEZ6pCe.jpg', 'Witness the beginning of a happy ending.', '\"Action, Adventure, Comedy\"', '\"20th Century Fox, The Donners'' Company, Genre Films\"', 'United States of America', 'English')
INSERT INTO peliculas VALUES(299536, 'Avengers: Infinity War', 8.255, 27713, 'Released', '2018-04-25', 2052415039, 149, 0, '/mDfJG3LC3Dqb67AZ52x3Z0jU0uB.jpg', 300000000, 'https://www.marvel.com/movies/avengers-infinity-war', 'tt4154756', 'en', 'Avengers: Infinity War', '\"As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.\"', 154.34, '/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg', 'An entire universe. Once and for all.', '\"Adventure, Action, Science Fiction\"', 'Marvel Studios', 'United States of America', '\"English, Xhosa\"')
INSERT INTO peliculas VALUES(550, 'Fight Club', 8.438, 27238, 'Released', '1999-10-15', 100853753, 139, 0, '/hZkgoQYus5vegHoetLkCJzb17zJ.jpg', 63000000, 'http://www.foxmovies.com/movies/fight-club', 'tt0137523', 'en', 'Fight Club', '\"A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"\"fight clubs\"\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.\"', 69.498, '/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg', 'Mischief. Mayhem. Soap.', 'Drama', '\"Regency Enterprises, Fox 2000 Pictures, Taurus Film, Atman Entertainment, Knickerbocker Films, The Linson Company, 20th Century Fox\"', 'United States of America', 'English')
INSERT INTO peliculas VALUES(118340, 'Guardians of the Galaxy', 7.906, 26638, 'Released', '2014-07-30', 772776600, 121, 0, '/uLtVbjvS1O7gXL8lUOwsFOH4man.jpg', 170000000, 'http://marvel.com/guardians', 'tt2015381', 'en', 'Guardians of the Galaxy', '\"Light years from Earth, 26 years after being abducted, Peter Quill finds himself the prime target of a manhunt after discovering an orb wanted by Ronan the Accuser.\"', 33.255, '/r7vmZjiyZw9rpJMQJdXpjgiCOk9.jpg', 'All heroes start somewhere.', '\"Action, Science Fiction, Adventure\"', 'Marvel Studios', 'United States of America', 'English')
INSERT INTO peliculas VALUES(680, 'Pulp Fiction', 8.488, 25893, 'Released', '1994-09-10', 213900000, 154, 0, '/suaEOtk1N1sgg2MTM7oZd2cfVp3.jpg', 8500000, 'https://www.miramax.com/movie/pulp-fiction/', 'tt0110912', 'en', 'Pulp Fiction', '\"A burger-loving hit man, his philosophical partner, a drug-addled gangster''s moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.\"', 74.862, '/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg', 'Just because you are a character doesn''t mean you have character.', '\"Thriller, Crime\"', '\"Miramax, A Band Apart, Jersey Films\"', 'United States of America', '\"English, Spanish, French\"')
END
GO
