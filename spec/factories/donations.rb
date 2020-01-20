FactoryBot.define do
  factory :donation do
    donor { 'Byrne' }
    date { 20.days.ago }
    amount_cents { 250000 }
  end
end
