DROP TABLE pokemons CASCADE;
DROP TABLE trainers CASCADE;
DROP TABLE owned_pokemons CASCADE;

CREATE TABLE trainers (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE pokemons (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE owned_pokemons (
    id serial4 primary key,
    pokemon_id int4 references Pokemons(id),
    trainer_id int4 references Trainers(id)
);
