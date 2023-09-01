/* Populate database with sample data. */
-- INSERT Queries
-- Animal:Agumon 
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES ('Agumon', 1,'2020-2-3',0,true,10.23);
-- Animal:Gabumon 
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', 2,'2018-11-15',2,true,8.0);
-- Animal:Pikachu
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', 3,'2021-1-7',1,false,15.04);
-- Animal:Devimon
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', 4,'2017-5-12',5,true,11.0);
-- Animal:Charmander
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', 5,'2020-2-8',0,false,-11.0);
-- Animal:Plantmon
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Platmon', 6,'2021-11-15',2,true,-5.7);
-- Animal:Squirtle
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', 7,'1993-4-2',3,false,-12.13);
-- Animal:Angemon
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', 8,'2005-6-12',1,true,-45.0);
-- Animal:Boarmon
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', 9,'2005-6-7',7,true,20.4);
-- Animal:Blossom
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', 10,'1998-10-13',3,true,17.0);
-- Animal:Ditto
INSERT INTO animals (name, id, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', 11,'2022-5-14',4,true,22.0);

--Inseration of Data in Ownwers Table
--Owner: Sam Smith
INSERT INTO owners (full_name, age)
VALUES ('Sam Smith',34);
--Owner: Jennifer Orwell 
INSERT INTO owners (full_name, age)
VALUES ('Jennifer Orwell',19);
--Owner: Bob
INSERT INTO owners (full_name, age)
VALUES ('Bob',45);
--Owner: Melody Pond
INSERT INTO owners (full_name, age)
VALUES ('Melody Pond',77);
--Owner: Dean Winchester 
INSERT INTO owners (full_name, age)
VALUES ('Dean Winchester',14);
--Owner: Jodie Whittaker
INSERT INTO owners (full_name, age)
VALUES ('Jodie Whittaker',38);

--Insersation in Spieces Table;
--spiece: Pokemon
INSERT INTO species (name)
VALUES ('Pokemon');
--spiece: Digimon
INSERT INTO species (name)
VALUES ('Digimon');

--Modify your inserted animals so it includes the species_id value;
--If the name ends in "mon" it will be Digimon

UPDATE animals SET species_id = 2 
WHERE name LIKE '%mon';

--All other animals are Pokemon

UPDATE animals SET species_id = 1 
WHERE name NOT LIKE '%mon';

--Modify your inserted animals to include owner information (owner_id)
--Sam Smith owns Agumon;

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';

--Jennifer Orwell owns Gabumon and Pikachu.

UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';

--Bob owns Devimon and Plantmon

UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Platmon';

--Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

--Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


-- Insersation in Vets Table;
Insert the following data for vets:
--Vet William Tatcher
INSERT INTO vets (name,age,date_of_graduation)
VALUES ('William Tatcher',45,'2000-4-23');
--Vet Maisy Smith
INSERT INTO vets (name,age,date_of_graduation)
VALUES ('Maisy Smith',26,'2019-1-17');
--Vet Stephanie Mendez
INSERT INTO vets (name,age,date_of_graduation)
VALUES ('Stephanie Mendez',64,'1981-5-4');
--Vet Jack Harkness
INSERT INTO vets (name,age,date_of_graduation)
VALUES ('Jack Harkness',38,'2008-6-8');