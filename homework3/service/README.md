# Homework3 Service

This is the data service application for [Homework 3](https://github.com/calvin-cs262-organization/monopoly-project) 
and it is deployed here: <https://evening-lowlands-31799.herokuapp.com/>

It is based on the standard [Heroku with Node.js tutorial](https://devcenter.heroku.com/articles/getting-started-with-nodejs) and [Lab 9](https://github.com/kny4/cs262/tree/master/lab09)

The database is relational with the schema specified in the `sql/` sub-directory, and is hosted on [ElephantSQL](https://www.elephantsql.com/). The database user and password are stored as Heroku configuration variables rather than in this (public) repo.

### Homework3 Questions
a. What are the (active) URLs for your data service?
* https://guarded-refuge-72375.herokuapp.com/
* https://guarded-refuge-72375.herokuapp.com/games
* https://guarded-refuge-72375.herokuapp.com/players\n
* https://guarded-refuge-72375.herokuapp.com/players/:id
* router.put("/players/:id", updatePlayer);
* router.post('/players', createPlayer);
* router.delete('/players/:id', deletePlayer);

b. Which of these endpoints implement actions that are idempotent? nullipotent?
* nullipotent: 
  * https://guarded-refuge-72375.herokuapp.com/
  * https://guarded-refuge-72375.herokuapp.com/games
  * https://guarded-refuge-72375.herokuapp.com/players
  * https://guarded-refuge-72375.herokuapp.com/players/:id
  * router.post('/players', createPlayer);
* idempotent:
  * router.put("/players/:id", updatePlayer);
  * router.delete('/players/:id', deletePlayer);

c. Is the service RESTful? If not, why not? If so, what key features make it RESTful.
* The service is RESTful because it implements the common http methods: get, post, delete, and put.

d. Is there any evidence in your implementation of an impedance mismatch?
* Since there are differences between the tables and classes, there is an impedance mismatch. 
