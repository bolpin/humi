class Donation < ApplicationRecord
  belongs_to :grant
  validates_presence_of :amount_cents, :date

  monetize :amount_cents
end
