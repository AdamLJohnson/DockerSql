# Docker SQL

I wanted to learn how to start MSSQL in a Docker Container. Then once the container is up run through [Evolve](https://evolve-db.netlify.app/) migration scripts so the DB can be scaffolded out. 

## How To

1. Clone down this repo
1. Run `docker build -t docker-sql .` 
1. Run `docker run -p 1433:1433 -d docker-sql`
1. Wait about 30 seconds. If you watch the log you will want to wait until you see `Done Migrating DB`. 
1. Open up SSMS and connect to `localhost` using username `sa` and password `Password!`
1. Profit