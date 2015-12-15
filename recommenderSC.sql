DROP database if exists `recommenderSC`;
CREATE database if not exists `recommenderSC`;

DROP TABLE IF EXISTS recommenderSC.`FilmFact`;
DROP TABLE IF EXISTS recommenderSC.`Genre`;
DROP TABLE IF EXISTS recommenderSC.`Film`;
DROP TABLE IF EXISTS recommenderSC.`Actor`;

CREATE TABLE recommenderSC.`Genre` (
	id_genre int NOT NULL,
    name varchar(255) NOT NULL,
	PRIMARY KEY(id_genre)
);

CREATE TABLE recommenderSC.`Film`(
	id_film int NOT NULL,
    title varchar(255) NOT NULL,
    primary key(id_film)
);

CREATE TABLE recommenderSC.`Actor`(
	id_actor int auto_increment,
    id_film int NOT NULL,
    name varchar(255) NOT NULL,
    primary key(id_actor)
);

CREATE TABLE recommenderSC.`FilmFact`(
	ID int auto_increment,
	id_film int NOT NULL,
    id_actor int NOT NULL,
    id_genre int NOT NULL,
    rating int,
    rating_age int,
    primary key(ID, id_film, id_actor, id_genre),
    foreign key(id_film)
		references recommenderSC.`Film`(id_film)
        ON DELETE CASCADE,
	foreign key(id_actor)
		references recommenderSC.`Actor`(id_actor)
        ON DELETE CASCADE,
	foreign key(id_genre)
		references recommenderSC.`Genre`(id_genre)
        ON DELETE CASCADE
);
