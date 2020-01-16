class Grant < ApplicationRecord
  belongs_to :partner
  has_many :disbursements
  monetize :amount_cents

  def name
    "#{partner.name} #{date.year}"
  end
end
