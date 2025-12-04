# README

This application uses Ruby 3.3.10, React 19.2.0, and Postgresql.

It is assumed that the user has a working installation of git, docker, and docker compose.

To install the application, run:

git clone https://github.com/tthompson0522/tasks_api.git

git clone https://github.com/tthompson0522/tasks_web.git

cd tasks_api

./setup.sh

This will build the application images, start the containers, and initialize the database. 

Once running, the application can be accessed at http://localhost:5173

The application allows the user to create, retrieve, update, and delete task lists, as well as create, retrieve, update, and delete tasks within these lists. The user can also search for individual tasks to update or delete them.

To stop the application, run:

docker compose down
