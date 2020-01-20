FactoryBot.define do
  factory :grant do
		partner
    date { Date.new(2020, 2, 4) }
    amount_cents { 2000000 }
  end
end
