# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# Partners
p1 = Partner.create!(name: 'Matt & Co.', address: '1234 Main St')
p2 = Partner.create!(name: 'Matts pizza', address: '12345 Main St')
p3 = Partner.create!(name: 'Humi', address: '123456 Main St')

# Users
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', partner: p3) if Rails.env.development?
User.create!(email: 'partner@example.com', password: 'password', password_confirmation: 'password', partner: p1) if Rails.env.development?
User.create!(email: 'partner@demo.com', password: 'password', password_confirmation: 'password', partner: p2) if Rails.env.development?


# Grants
g1 = Grant.create!(partner: p1, amount_cents: 1000000, date: DateTime.now, case_management_percentage: 10)
g2 = Grant.create!(partner: p2, amount_cents: 1000000, date: DateTime.now, case_management_percentage: 10)

# Donations
Donation.create!(grant: g1, donor: 'Andrew S.', amount_cents: 10000, date: DateTime.now)
Donation.create!(grant: g1, donor: 'Brian O.', amount_cents: 20000, date: DateTime.now)
Donation.create!(grant: g2, donor: 'Travis S.', amount_cents: 20000, date: DateTime.now)

# Disbursements
Disbursement.create!(grant: g1, name: 'Olpin Family', landlord: 'Johnny Rose', move_in_amount_cents: 10000, prevention_amount_cents: 0, number_children: 3, date: DateTime.now)
Disbursement.create!(grant: g1, name: 'Rain Family', landlord: 'Riverview Suites', move_in_amount_cents: 2000, prevention_amount_cents: 20000, number_children: 1, date: DateTime.now)
