# Users balance

This simple app provides API what allow to get list of users with info about balance, allow to create and delete operations.

You need to install docker and docker-compose. After it run:
1. `docker-compose run web rake db:create`
2. `docker-compose run web rake db:migrate`
3. `docker-compose run web rake db:seed`
4. `docker-compose up`.
