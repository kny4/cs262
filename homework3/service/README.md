# Service

This is the data service application for [Homework3](https://github.com/calvin-cs262-organization/monopoly-project) 
and it is deployed here:
          
<https://cs262-monopoly-service.herokuapp.com/>

It is based on the standard [Heroku with Node.js tutorial](https://devcenter.heroku.com/articles/getting-started-with-nodejs) and [Lab09](https://github.com/kny4/cs262/tree/master/lab09)

The database is relational with the schema specified in the `sql/` sub-directory,
 and is hosted on [ElephantSQL](https://www.elephantsql.com/). The database user and password are stored as Heroku configuration variables rather than in this (public) repo.

### Homework3 Questions
a. What are the (active) URLs for your data service?
b. Which of these endpoints implement actions that are idempotent? nullipotent?
c. Is the service RESTful? If not, why not? If so, what key features make it RESTful.
d. Is there any evidence in your implementation of an impedance mismatch?
 