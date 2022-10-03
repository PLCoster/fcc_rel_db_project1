# Free Code Camp: Relational Database Project 1 - Celestial Bodies Database

## Celestial Bodies Database

The aim of this project was to build a small celestial bodies database using PostgreSQL.

Data for this project was sourced from [Wikipedia](https://www.wikipedia.org/).

### Project Requirements:

- **User Story #1:** You should create a database named `universe`

- **User Story #2:** Be sure to connect to your database with `\c universe`. Then, you should add tables named `galaxy`, `star`, `planet`, and `moon`

- **User Story #3:** Each table should have a primary key

- **User Story #4:** Each primary key should automatically increment

- **User Story #5:** Each table should have a `name` column

- **User Story #6:** You should use the `INT` data type for at least two columns that are not a primary or foreign key

- **User Story #7:** You should use the `NUMERIC` data type at least once

- **User Story #8:** You should use the `TEXT` data type at least once

- **User Story #9:** You should use the `BOOLEAN` data type on at least two columns

- **User Story #10:** Each "star" should have a foreign key that references one of the rows in `galaxy`

- **User Story #11:** Each "planet" should have a foreign key that references one of the rows in `star`

- **User Story #12:** Each "moon" should have a foreign key that references one of the rows in `planet`

- **User Story #13:** Your database should have at least five tables

- **User Story #14:** Each table should have at least three rows

- **User Story #15:** The `galaxy` and `star` tables should each have at least six rows

- **User Story #16:** The `planet` table should have at least 12 rows

- **User Story #17:** The `moon` table should have at least 20 rows

- **User Story #18:** Each table should have at least three columns

- **User Story #19:** The `galaxy`, `star`, `planet`, and `moon` tables should each have at least five columns

- **User Story #20:** At least two columns per table should not accept `NULL` values

- **User Story #21:** At least one column from each table should be required to be `UNIQUE`

- **User Story #22:** All columns named `name` should be of type `VARCHAR`

- **User Story #23:** Each primary key column should follow the naming convention `table_name_id`. For example, the `moon` table should have a primary key column named `moon_id`

- **User Story #24:** Each foreign key column should have the same name as the column it is referencing

### Project Writeup:

The first Free Code Camp: Relational Databases project is a small relational database for celestial bodies. It contains four tables:

- `galaxy` - containing galaxy names, descriptions, estimated masses and the type of galaxy (reference to galaxy_type table)
  - `galaxy_type` - containing the name, symbol and description of four types of galaxy.
- `star` - containing the names, mass, luminosity, temperature, radius and containing galaxy (reference to galaxy_id) of stars.
- `planet` - containing the name, mass, radius, number of moons, and dwarf planet status for planets, as well as the parent star for each planet (reference to star_id)
- `moon` - containing the name, description, radius, mass and volume of a moon, as well as its parent planet (reference to planet_id)

Note that the database is not complete, particularly the moon table which only contains values in the 'name' column for each entry.

### Usage

The database can be interacted with using `psql` in linux. First start up a PostgreSQL server using:

`$sudo service postgresql start`

Load the database using:

`$psql --dbname=postgres < universe.sql`

Log into the database using:

`$psql --dbname=postgres`

Save a dump of the database using:

`$pg_dump -cC --inserts universe > universe.sql`

Instructions for building the project can be found at https://www.freecodecamp.org/learn/relational-database/build-a-celestial-bodies-database-project/build-a-celestial-bodies-database
