FactoryBot.define do
  factory :user do
    partner
		admin { false }
    email { "me@example.com" }
    password { "password" }

    factory :admin do
      admin { true }
    end
  end
end
