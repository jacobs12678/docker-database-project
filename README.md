# Docker Database Project
This project sets up an SQL database that retrieves information of UMBC students for the Lost and Found retrieval service. It includes table creation, data population, and container creation via Docker Compose.

# Usage
The user can access the database on their own system by cloning the repository using specific Docker commands 
'docker compose up
or
docker-compose up'
This starts the container and will automatically run the SQL scripts to create and populate the tables of data.

# Accessing the Database
From there, the user can use another Docker command "docker exec -it my_project_db psql -U student -d projectdb" to access the shell. Afterward, the user can select from users and/or items to research into.

# Database Schema
loginsign: Stores signin information
submitlog: Stores all important statuses
searchdisplay: Search for any specific item
subscription: Contact subscription information
ticket: Access ticket info

# Stopping/Cleaning Up

"docker compose down
docker compose down -v"
