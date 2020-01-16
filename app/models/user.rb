class User < ApplicationRecord
  belongs_to :partner
  has_many :grants, through: :partners
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
  # devise modules available include:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  # 
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable
end
