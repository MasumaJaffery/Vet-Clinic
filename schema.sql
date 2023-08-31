/* Database schema to keep the structure of entire database. */
-- Create Database;
CREATE DATABASE VetClinic;
-- Create Table;
CREATE TABLE animals (
    name varchar(100),
    id integer  NOT NULL PRIMARY KEY,
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg decimal
);

ALTER TABLE animals ADD species STRING;

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

