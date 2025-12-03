#!/bin/sh

docker compose build

docker compose up -d

docker compose exec api bash -c "bin/rails db:create && bin/rails db:migrate && exit"

