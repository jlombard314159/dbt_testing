# dbt_testing
meow

# dbt steps
Part of this came directly from:
https://docs.getdbt.com/guides/manual-install?step=1

- Via python install dbt-core. Can do this in conda
- install the appropriate adapter. Seems to only work via pip

- run `dbt init project_name`. This makes some stuff. But it also 

- modify the `dbt_project.yml` file that gets created

- Create a `profiles.yml` and edit accordingly. It's really set up for a particular DB connection.

- run `dbt debug` and debug accordingly.

- Modify anything that is in `models` for a more appropriate query for your dataset

- SQLITE3 prettyy output printing: `.mode table`

- add in tests: create a `schema.yml` in /models

- For more complicated tests add a `.sql` in `/tests`. But you also need a `.yml` in the `tests` folder.

- run `dbt test` to identify if tests succeed

## Does this work at census

Steps that JAL thinks he can do in docker: all the dbt stuff

## Some general things

DBT sort of info:
`/seeds`: A place to store csvs for some reason
`/analyses`: A place to create .SQL files programmatically
`/macros`: The dumb jinja crap 
`/models`: Data modeling that almost always requires a physical change to a DB
`/tests`: Testing of SQL
`/snapshots`: Recording changes to mutable tables over time. 