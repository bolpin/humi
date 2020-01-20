FactoryBot.define do
  factory :partner do
    name { 'Family Promise' }
		address { '25 Broadway' }
    partner_number { '555-1234' }
    grants { [] }
  end
end
