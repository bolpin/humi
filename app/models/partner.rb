class Partner < ApplicationRecord
  has_many :grants
  validates_uniqueness_of :name

  def default_grant
    grants.last
  end
end
