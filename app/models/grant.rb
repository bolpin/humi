class Grant < ApplicationRecord
  belongs_to :partner

  monetize :amount_cents

  def name
    "#{partner.name} #{date.year}"
  end
end
