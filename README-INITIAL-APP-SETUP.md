Steps to create the initial version of this project, through the
setup of rspec, devise, activeadmin, and docker:
```
rails new humi -T -d postgresql
cd humi
vi Gemfile
   (add rspec-rails)
bundle install
rails generate rspec:install
vi config/database.yml
   (add postgres host/username/password)
vi Gemfile
   (add devise)
bundle install
rails g devise:install
rails g devise user
rails db:create
rails db:migrate
vi app/models/user.rb
   (remove registerable module)
vi db/seeds.rb
   (add initial test user w/credentials)
mkdir app/views/home
vi app/views/home/index.html.erb
vi app/controllers/home_controller
rails db:migrate
psql -d humi_development
rails db:seed
rails generate model Partner name:string address:string partner_number:string
rake db:migrate
rails generate active_admin:resource Partner
rake db:migrate
vi app/admin/partners.rb
vi Dockerfile
vi docker-compose.yml
vi .dockerignore
docker-compose run web rake db:create
vi config/environments/development.rb
   (disable yarn integrity warning - probably ought to actually figure out how to install yarn correctly)
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
docker-compose up
rspec
```
