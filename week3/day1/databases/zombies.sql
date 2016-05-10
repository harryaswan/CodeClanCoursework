-- CREATE TABLE zombies (
--     id SERIAL8 primary key,
--     name VARCHAR(255) not null,
--     type VARCHAR(255)
-- );
-- CREATE TABLE victims (
--     id SERIAL8 primary key,
--     name VARCHAR(255) not null,
--     run_speed INT2
-- );
--
-- CREATE TABLE bittings (
--     id SERIAL8 primary key,
--     zombie_id INT8 references zombies(id),
--     victim_id INT8 references victims(id),
--     infected_on DATE not null
-- );


-- INSERT INTO bittings (zombie_id, victim_id, infected_on) VALUES (1, 1, 'Jan 01 2016');
-- INSERT INTO bittings (zombie_id, victim_id, infected_on) VALUES (2, 3, 'Dec 25 2015');
-- INSERT INTO bittings (zombie_id, victim_id, infected_on) VALUES (4, 2, 'Mar 08 2016');
-- INSERT INTO bittings (zombie_id, victim_id, infected_on) VALUES (1, 4, 'Jun 12 2016');


-- INSERT INTO victims (name, run_speed) VALUES ('Beth', 72);
-- INSERT INTO victims (name, run_speed) VALUES ('Rick', 100);
-- INSERT INTO victims (name, run_speed) VALUES ('Zsolt', 12);
-- INSERT INTO victims (name, run_speed) VALUES ('Kat', 32);

-- INSERT INTO zombies (name, type) VALUES ('Zak', 'Drooler');
-- INSERT INTO zombies (name, type) VALUES ('Alistair', 'Smoker');
-- INSERT INTO zombies (name, type) VALUES ('Chris', 'Tank');
-- INSERT INTO zombies (name, type) VALUES ('Henry', 'Walker');
