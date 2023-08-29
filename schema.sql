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
