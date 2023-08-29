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
