FactoryBot.define do
  factory :disbursement do
		grant
		# grant { Grant.first || association(:grant) }
    name { 'Smith' }
    number_children { 2 }
    date { 15.days.ago }
    move_in_amount_cents { 20000 }
    prevention_amount_cents { 0 }
  end
end
