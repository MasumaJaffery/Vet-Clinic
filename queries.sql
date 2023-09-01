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
--Verify Changes were Made;
SELECT * FROM animals;
--Commit the transaction.
COMMIT;
--Transcation 3.
--Delete all records in the animals table;
DELETE From animals;
--rollback verify if all records in the animals table still exists. 
ROLLBACK;
--Transcation 4.
BEGIN;
--Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
-- Savepoints are used to set points within a transaction to which you can later roll back if needed.
SAVEPOINT delete_savepoint
--Update all animals' weight to be their weight multiplied by -1.

UPDATE animals SET weight_kg = weight_kg * -1;
--Rollback to the savepoint
ROLLBACK TO SAVEPOINT delete_savepoint;
--Update all animals' weights that are negative to be their weight multiplied by -1.
-- We used 0 because > than zero negative values starts;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
--Commit transaction
COMMIT
-- Queries;
-- How many animals are there?

SELECT COUNT(*) AS Total From animals;

--How many animals have never tried to escape

SELECT COUNT(*) AS NotEscape From animals WHERE escape_attempts = 0;

--What is the average weight of animals?

SELECT AVG(weight_kg) FROM animals;

--Who escapes the most, neutered or not neutered animals?
-- GROUP BY Clause is used to analyze two columns from table animals.

SELECT neutered AS neutered_animals, MAX(escape_attempts) AS animals_escape_the_most FROM animals GROUP BY neutered;


--What is the minimum and maximum weight of each type of animal?

SELECT MIN(weight_kg) as MinWeight from animals;
SELECT MAX(weight_kg) as MaxWeight from animals;

--What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts) AS avg_escape
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

--What animals belong to Melody Pond?
--owners.full_name => owners is tablename and used as alias that means refer to something.
--INNER JOIN => INNER JOIN only includes the rows of selected columns that satisfy the condition.

SELECT owners.full_name AS ownername, animals.name AS animalname
FROM owners
INNER JOIN animals ON owners.id = animals.owner_id
WHERE owners.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).

SELECT animals.name AS pokemons
    FROM animals
    INNER JOIN species ON species_id = species.id
    WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
--STRING_AGG => SQL aggregate function that is used to concatenate values from multiple rows into a single string, separated by a COMMA.
--LEFT JOIN =>  Retrieve all the records from the left table and matching records from the right table. If there's no match in the right table, the result will still include the records from the left table, with null values in the columns from the right table.
SELECT full_name AS owner, 
    STRING_AGG(animals.name, ', ') AS pokemons
    FROM owners
    LEFT JOIN animals ON owners.id = owner_id
    GROUP BY owners.full_name;
-- List all Digimon owned by Jennifer Orwell.
SELECT 
    owners.full_name AS owner,
    animals.name AS digimons
    FROM owners
    JOIN animals ON owners.id = owner_id
    JOIN species ON species.id = species_id
    WHERE owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT 
    animals.name AS Mr_Winchester_pets,
    animals.escape_attempts
    FROM animals
    JOIN owners ON owner_id = owners.id
    WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;

-- Who owns the most animals?
SELECT 
    owners.full_name AS owners,
    COUNT(animals.owner_id) AS pets_amount
    FROM owners
    LEFT JOIN animals ON owners.id = owner_id
    GROUP BY owners;