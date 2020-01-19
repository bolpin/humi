# Quickstart

## Local (requires postgres)

```
rails db:create
rails db:migrate
rails db:seed
./bin/webpack-dev-server
rails server
```
For user credentials see db/seeds.rb.

## Docker
TODO: figure out how to properly install node and yarn in Dockerfile.  When that is done, we should be able to do the following:
```
docker-compose build
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rails db:seed
docker-compose up
```

# Running tests

```
rspec
```

# TODO

priorities:
- format dates nicely
- monthly report view
- test forgot password

nice-to-haves:
- audit trail model & migration
- model and form for estimates
- populate a template .xls file(?)
- export to CSV for grant reports, etc.?
- database backups
- RDS Postgres deployment/configuration


[If interested in steps to do initial app setup with docker, postgres, rspec, devise and activeadmin](./README-INITIAL-APP-SETUP.md)

# Models

optional:
```
rails generate model Payment grant:references date:date check_number:integer amount_cents:integer approval:string donation_amount_cents:integer case_management_amount_cents:integer balance_amount_cents:integer

rails generate model Estimate grant:references month:integer move_in_amount_cents:integer prevention_amount_cents:integer

```
Workflow:
1. Grant is applied for and created (Grants are two-years in duration, with a single payment made each year to match initial local donations) At this point, the Grant is created in the application, and any necessary user accounts for the partner are set up by an admin.
1. Partner is required to find local donations for the initial $10K.  Details of these initial large donations are not recorded by this application.
1. First (of two) annual grant payments are made to the partner (This payment is recorded by an admin)
1. Partner makes monthly estimates of move-in and prevention amounts for the first year. (Recorded by partner)
1. Each month, the partner continues to solicit more local donations (recorded as Donations by partner)
1. Each month, the partner makes disbursements.  A disbursement is a payment from the partner to a local family in need.  (Recorded as Disbursements by partner)
1. For the second year of the grant, the same pattern continues.
1. After the second year the collaboration is over, pending an additional grant application.
```

Some setup you must do manually if you haven't yet:

1. Ensure you have defined default url options in your environments files. Here
	is an example of default_url_options appropriate for a development environment
	in config/environments/development.rb:

	config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

	TODO: In production, :host should be set to the actual host of your application.

```

