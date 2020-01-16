class Disbursement < ApplicationRecord
  belongs_to :grant
  validates_presence_of :number_children, :name

  monetize :move_in_amount_cents
  monetize :prevention_amount_cents
end
