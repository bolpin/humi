class Grant < ApplicationRecord
  belongs_to :partner
  has_many :disbursements

  def name
    "#{partner.name} #{date.year}"
  end
end
