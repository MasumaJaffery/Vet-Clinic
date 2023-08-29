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