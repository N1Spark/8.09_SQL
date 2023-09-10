--CREATE DATABASE Publishment
USE Publishment

CREATE TABLE Themes (
	id int PRIMARY KEY identity(1,1),
	name nvarchar(50) UNIQUE NOT NULL
)

CREATE TABLE Country (
	id int PRIMARY KEY identity(1,1),
	name nvarchar(50) UNIQUE NOT NULL
)

CREATE TABLE Shops (
	id int PRIMARY KEY identity(1,1),
	name nvarchar(50) UNIQUE NOT NULL,
	id_country int REFERENCES Country(id)
)

CREATE TABLE Authors (
	id int PRIMARY KEY identity(1,1),
	firstname nvarchar(50) UNIQUE NOT NULL,
	lastname nvarchar(50) UNIQUE NOT NULL,
	id_country int REFERENCES Country(id)
)

CREATE TABLE Books (
	id int PRIMARY KEY identity(1,1),
	name nvarchar(50) UNIQUE NOT NULL,
	id_theme int REFERENCES Themes(id),
	id_author int REFERENCES Authors(id),
	price money NOT NULL DEFAULT 0 CHECK (price >= 0),
	date_of_publish date NOT NULL,
	pages int NOT NULL DEFAULT 0 CHECK (pages >= 0)
)

CREATE TABLE Sales (
	id int PRIMARY KEY identity(1,1),
	id_book int REFERENCES Books(id),
	date_of_sale date NOT NULL,
	price money NOT NULL DEFAULT 0 CHECK (price >= 0),
	quantity int NOT NULL DEFAULT 0 CHECK (quantity >= 0),
	id_shop int REFERENCES Shops(id)
)