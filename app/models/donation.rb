class Donation < ApplicationRecord
  belongs_to :grant

  monetize :amount_cents
end
