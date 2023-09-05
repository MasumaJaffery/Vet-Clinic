SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;

SELECT * FROM owners WHERE email = 'owner_18327@mail.com';
EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';

SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;
