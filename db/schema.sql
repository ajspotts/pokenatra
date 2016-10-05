DROP TABLE IF EXISTS pokemons;

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  cp INT,
  poke_type TEXT,
  img_url TEXT
);
