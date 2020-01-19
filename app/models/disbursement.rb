class Disbursement < ApplicationRecord
  belongs_to :grant
  validates_presence_of :number_children, :name, :date, :move_in_amount_cents, :prevention_amount_cents

  monetize :move_in_amount_cents
  monetize :prevention_amount_cents
end
