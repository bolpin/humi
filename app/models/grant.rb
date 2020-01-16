class Grant < ApplicationRecord
  belongs_to :partner

  def name
    "#{partner.name} #{date.year}"
  end
end
