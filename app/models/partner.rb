class Partner < ApplicationRecord
  has_many :grants
  has_many :users
  validates_presence_of :name
end
