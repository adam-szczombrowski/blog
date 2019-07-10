### README

This is a repository for my personal blog, made with the help of Mckenzie Child tutorial.

### Docker

To run the app with docker run

`docker-compose up`

Then to create and migrate the db (in other terminal window)

`docker-compose run web rake db:create db:migrate`

Then visit localhost:3000 and you should be good to go
