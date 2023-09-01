/* Database schema to keep the structure of entire database. */
-- Create Database;
CREATE DATABASE VetClinic;
-- Create Table;
CREATE TABLE animals (
    name varchar(100),
    id SERIAL  NOT NULL PRIMARY KEY,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species text;

--Create Table owners

CREATE TABLE owners (
    id serial PRIMARY KEY,
    full_name TEXT,
    age integer
)

--Create Table species

CREATE TABLE species (
    id serial PRIMARY KEY,
    name TEXT
)

--Remove Spieces Column from animals table

ALTER table animals
DROP column species;

-- Add species_id AND owner_id as Columns in table animals;

ALTER table animals
ADD column species_id INTEGER;

ALTER table animals
ADD column owner_id INTEGER;

--Add CONSTRAINT as FOREIGN KEY on species_id and owner_id;
-- (species_id) is they column in animals table.
-- species(id) shows table species had column id.

ALTER table animals
Add CONSTRAINT fk_species
FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals
ADD CONSTRAINT owner_species
FOREIGN KEY (owner_id) REFERENCES owners(id);


--CREATE Table vets
CREATE TABLE vets (
id serial PRIMARY KEY,
name TEXT,
age integer,
date_of_graduation date
);

-- Create table Specialiazation
CREATE TABLE Specialization (
    specialize_id SERIAL PRIMARY KEY,
    species_id INTEGER,
    vets_id INTEGER,
    FOREIGN KEY(species_id) REFERENCES species(id),
    FOREIGN KEY(vets_id) REFERENCES vets(id)
);

-- Create Table visit
CREATE TABLE visit(
    visit_id SERIAL PRIMARY KEY,
    vets_id INT,
    animals_id INT,
    date_of_visit DATE NOT NULL,
    FOREIGN KEY(vets_id) REFERENCES vets(id),
    FOREIGN KEY(animals_id) REFERENCES animals(id)
);