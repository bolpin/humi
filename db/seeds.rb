# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Partners
p1 = Partner.create!(name: 'Skagit Kiwanis', address: '1234 Elm St')
p2 = Partner.create!(name: 'Family Promise of Colorado Springs', address: '12345 Cedar Ave')
p3 = Partner.create!(name: 'HUMI', address: '123456 Main St')
p4 = Partner.create!(name: 'First Congregational Church of Everett', address: '12 Boylston Ave')

# Users
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', partner: p3, admin: true) if Rails.env.development?
User.create!(email: 'partner@example.com', password: 'password', password_confirmation: 'password', partner: p1, admin: false) if Rails.env.development?
User.create!(email: 'partner@demo.com', password: 'password', password_confirmation: 'password', partner: p2, admin: false) if Rails.env.development?


# Grants
# g0 = Grant.create!(partner: p3, amount_cents: 0, date: DateTime.now, case_management_percentage: 0)
g1 = Grant.create!(partner: p1, amount_cents: 1000000, date: DateTime.now - 1.year, case_management_percentage: 10)
g2 = Grant.create!(partner: p2, amount_cents: 1000000, date: DateTime.now - 1.year, case_management_percentage: 10)

# Donations
Donation.create!(grant: g1, donor: 'Andrew P.', amount_cents: 10000, date: DateTime.now - 12.months)
Donation.create!(grant: g1, donor: 'Barney P.', amount_cents: 60000, date: DateTime.now - 11.months)
Donation.create!(grant: g1, donor: 'Brian C.', amount_cents: 20000, date: DateTime.now - 11.months)
Donation.create!(grant: g1, donor: 'Christina M.', amount_cents: 29000, date: DateTime.now - 1.month)
Donation.create!(grant: g1, donor: 'Fred O.', amount_cents: 20000, date: DateTime.now - 12.months)
Donation.create!(grant: g1, donor: 'Squarepants P.', amount_cents: 10000, date: DateTime.now - 1.month)

Donation.create!(grant: g2, donor: 'Doug B.', amount_cents: 20000, date: DateTime.now - 1.month)
Donation.create!(grant: g2, donor: 'Matt B.', amount_cents: 20600, date: DateTime.now)
Donation.create!(grant: g2, donor: 'Matt O.', amount_cents: 27000, date: DateTime.now - 12.months)
Donation.create!(grant: g2, donor: 'Travis S.', amount_cents: 50000, date: DateTime.now - 12.months)
Donation.create!(grant: g2, donor: 'Travis S.', amount_cents: 90000, date: DateTime.now - 11.months)
Donation.create!(grant: g2, donor: 'Wolfgang B.', amount_cents: 25000, date: DateTime.now)

# Disbursements
Disbursement.create!(grant: g1, name: 'Ellis Family', landlord: 'Riverview Suites', move_in_amount_cents: 24000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 1.month)
Disbursement.create!(grant: g1, name: 'Ellis Family', landlord: 'Riverview Suites', move_in_amount_cents: 24000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 12.month)
Disbursement.create!(grant: g1, name: 'Jones Family', landlord: 'Riverview Suites', move_in_amount_cents: 29000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 12.months)
Disbursement.create!(grant: g1, name: 'Jones Family', landlord: 'Riverview Suites', move_in_amount_cents: 29000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 3.months)

Disbursement.create!(grant: g2, name: 'Smith Family', landlord: 'Riverview Suites', move_in_amount_cents: 24000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 1.month)
Disbursement.create!(grant: g2, name: 'Winfred Family', landlord: 'Riverview Suites', move_in_amount_cents: 24000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 12.month)
Disbursement.create!(grant: g2, name: 'Jones Family', landlord: 'Riverview Suites', move_in_amount_cents: 29000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 12.months)
Disbursement.create!(grant: g2, name: 'James Family', landlord: 'Riverview Suites', move_in_amount_cents: 29000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 3.months)
Disbursement.create!(grant: g2, name: 'Miller Family', landlord: 'Riverview Suites', move_in_amount_cents: 2000, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now)
Disbursement.create!(grant: g2, name: 'Reinhold Family', landlord: 'Riverview Suites', move_in_amount_cents: 20500, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now - 11.months)
Disbursement.create!(grant: g2, name: 'Anderson Family', landlord: 'Riverview Suites', move_in_amount_cents: 20500, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now - 2.months)
Disbursement.create!(grant: g2, name: 'Sheeran Family', landlord: 'Johnny Rose', move_in_amount_cents: 1000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now - 11.months)
Disbursement.create!(grant: g2, name: 'Sparrow Family', landlord: 'Johnny Rose', move_in_amount_cents: 1000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now - 8.months)
Disbursement.create!(grant: g2, name: 'Ephrain Family', landlord: 'Riverview Suites', move_in_amount_cents: 20030, prevention_amount_cents: 20100, number_children: 1, date: DateTime.now - 11.months)
Disbursement.create!(grant: g2, name: 'Uriben Family', landlord: 'Riverview Suites', move_in_amount_cents: 20030, prevention_amount_cents: 20100, number_children: 1, date: DateTime.now - 2.months)
Disbursement.create!(grant: g2, name: 'Williams Family', landlord: 'Johnny Rose', move_in_amount_cents: 10000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now)
Disbursement.create!(grant: g2, name: 'Ellis Family', landlord: 'Riverview Suites', move_in_amount_cents: 24000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 1.month)
Disbursement.create!(grant: g2, name: 'Albert Family', landlord: 'Riverview Suites', move_in_amount_cents: 24000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 12.month)
Disbursement.create!(grant: g2, name: 'Jones Family', landlord: 'Riverview Suites', move_in_amount_cents: 29000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 12.months)
Disbursement.create!(grant: g2, name: 'Grace Family', landlord: 'Riverview Suites', move_in_amount_cents: 29000, prevention_amount_cents: 25000, number_children: 1, date: DateTime.now - 3.months)
Disbursement.create!(grant: g2, name: 'Miller Family', landlord: 'Riverview Suites', move_in_amount_cents: 2000, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now)
Disbursement.create!(grant: g2, name: 'Reinhold Family', landlord: 'Riverview Suites', move_in_amount_cents: 20500, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now - 10.months)
Disbursement.create!(grant: g2, name: 'Bollard Family', landlord: 'Riverview Suites', move_in_amount_cents: 20500, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now - 2.months)
Disbursement.create!(grant: g2, name: 'Sheeran Family', landlord: 'Johnny Rose', move_in_amount_cents: 1000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now - 10.months)
Disbursement.create!(grant: g2, name: 'Knorr Family', landlord: 'Johnny Rose', move_in_amount_cents: 1000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now - 8.months)
Disbursement.create!(grant: g2, name: 'Grimm Family', landlord: 'Riverview Suites', move_in_amount_cents: 20030, prevention_amount_cents: 20100, number_children: 1, date: DateTime.now - 10.months)
Disbursement.create!(grant: g2, name: 'Garcia Family', landlord: 'Riverview Suites', move_in_amount_cents: 20030, prevention_amount_cents: 20100, number_children: 1, date: DateTime.now - 2.months)
Disbursement.create!(grant: g2, name: 'Williams Family', landlord: 'Johnny Rose', move_in_amount_cents: 10000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now)
Disbursement.create!(grant: g2, name: 'Carey Family', landlord: 'Majestic Apts', move_in_amount_cents: 10000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now)
Disbursement.create!(grant: g2, name: 'Evers Family', landlord: 'Majestic Apts', move_in_amount_cents: 10000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now)
