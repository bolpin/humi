# Quickstart

## Local (requires postgres)

```
rails db:create
rails db:migrate
rails db:seed
rails server
```

navigate to `localhost:3000`
For user credentials see db/seeds.rb.

## Docker
TODO: figure out how to properly install node and yarn in Dockerfile.  When that is done, we should be able to:
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
- roles for users (admin or partner-grant-manager) -- cancancan?
- interface for admins to create and edit user roles and partner associations
- interface to link users to a parnter (or partners?)
- models for grants, disbursements, donations
- model and form for donations
- model and form for disbursements
- format money nicely
- format dates nicely
- monthly report view
- test forgot password
- test admin creates users
- test admin edits user role
- test admin resets a user password for them

nice-to-haves:
- audit trail model & migration
- model and form for estimates
- as much reporting as time permits
- export to CSV for grant reports, etc.?
- database backups (Ops)
- RDS Postgres deployment/configuration (Ops)


[If interested in steps to do initial app setup with docker, postgres, rspec, devise and activeadmin](./README-INITIAL-APP-SETUP.md)

# Possible Models
```
rails generate model Partner name:string address:string partner_number:string
rails generate model Grant partner:references amount_cents:integer date:date case_management_percentage:integer
rails generate model Donation grant:references donor:string date:date amount_cents:integer
rails generate model Disbursement grant:references name:string date:date move_in_amount_cents:integer prevention_amount_cents:integer landlord:string number_children:integer
```

optional:
```
rails generate model Payment grant:references date:date check_number:integer amount_cents:integer approval:string donation_amount_cents:integer case_management_amount_cents:integer balance_amount_cents:integer

rails generate model Estimate grant:references month_1_move_in_amount_cents:integer month_1_prevention_amount_cents:integer month_2_move_in_amount_cents:integer month_2_prevention_amount_cents:integer month_3_move_in_amount_cents:integer month_3_prevention_amount_cents:integer month_4_move_in_amount_cents:integer month_4_prevention_amount_cents:integer month_5_move_in_amount_cents:integer month_5_prevention_amount_cents:integer month_6_move_in_amount_cents:integer month_6_prevention_amount_cents:integer month_7_move_in_amount_cents:integer month_7_prevention_amount_cents:integer month_8_move_in_amount_cents:integer month_8_prevention_amount_cents:integer month_9_move_in_amount_cents:integer month_9_prevention_amount_cents:integer month_10_move_in_amount_cents:integer month_10_prevention_amount_cents:integer month_11_move_in_amount_cents:integer month_11_prevention_amount_cents:integer month_12_move_in_amount_cents:integer month_12_prevention_amount_cents:integer month_13_move_in_amount_cents:integer month_13_prevention_amount_cents:integer month_14_move_in_amount_cents:integer month_14_prevention_amount_cents:integer month_15_move_in_amount_cents:integer month_15_prevention_amount_cents:integer month_16_move_in_amount_cents:integer month_16_prevention_amount_cents:integer month_17_move_in_amount_cents:integer month_17_prevention_amount_cents:integer month_18_move_in_amount_cents:integer month_18_prevention_amount_cents:integer month_19_move_in_amount_cents:integer month_19_prevention_amount_cents:integer month_20_move_in_amount_cents:integer month_20_prevention_amount_cents:integer month_21_move_in_amount_cents:integer month_21_prevention_amount_cents:integer month_22_move_in_amount_cents:integer month_22_prevention_amount_cents:integer month_23_move_in_amount_cents:integer month_23_prevention_amount_cents:integer month_24_move_in_amount_cents:integer month_24_prevention_amount_cents:integer

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
rails generate active_admin:resource Partner
etc.


