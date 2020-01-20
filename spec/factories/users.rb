FactoryBot.define do
  factory :user do
    partner
		admin { false }
    email { "me@example.com" }
    password { "password" }
  end
end
