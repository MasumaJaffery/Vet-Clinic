/*Queries that provide answers to the questions from all projects.*/
-- Queries
--1. Find all animals whose name ends in "mon".
-- LIKE OPERATOR is used to compare column value against string PATTERN.
-- % is used to represent any no of sequence ( used for substring ).
SELECT * from animals WHERE name LIKE '%mon';
--2. List the name of all animals born between 2016 and 2019.
SELECT * from animals WHERE date_of_birth BETWEEN '2016-1-1' AND '2019-12-31';
--3. List the name of all animals that are neutered and have less than 3 escape attempts.
SELECT * FROM animals WHERE neutered = true AND escape_attempts >= 3;
--4. List the date of birth of all animals named either "Agumon" or "Pikachu".
-- IN OPERATOR allows you to match specify list of values and returns any pf true.
SELECT * FROM animals WHERE name IN ('Agumon','Pikachu');
--5. List name and escape attempts of animals that weigh more than 10.5kg.
SELECT * FROM animals WHERE weight_kg >= 10.5;
--6. Find all animals that are neutered.
SELECT * FROM animals WHERE neutered = true;
--7. Find all animals not named Gabumon.
SELECT * FROM animals WHERE name != 'Gabumon';
--8. Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg).ADD
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
--Transcations via Commit and Rollback;
--Before rollback we used commit command that saves all commands operations that runs before rollback,
--once rollback commited all previous operations like update,insert,delete reverts.
--Rollback not works on commands that done before Commit.
--Commit and Rollback only works for Insert,Update,Delete.
--Transcation 1.
BEGIN;
-- update the animals table by setting the species column to unspecified.
UPDATE animals SET species = 'unspecified';
-- check the update done!
SELECT * FROM animals;
--Then roll back the change and verify that the species columns went back to the state before the transaction.
ROLLBACK;
--Transcation 2.
BEGIN;
--Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
UPDATE animals set species = 'digimon' WHERE name LIKE '%mon';
--Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals set species = 'pokemon' WHERE species IS NULL;
