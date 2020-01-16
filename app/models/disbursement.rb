class Disbursement < ApplicationRecord
  belongs_to :grant

  monetize :move_in_amount_cents, :prevention_amount_cents
end
