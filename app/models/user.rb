class User < ApplicationRecord
  belongs_to :partner
  has_many :grants, through: :partner
  has_many :donations, through: :grants
  has_many :disbursements, through: :grants

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
