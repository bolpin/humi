class User < ApplicationRecord
  # devise modules available include:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  # :registerable
  devise :database_authenticatable,
         :recoverable,
         :rememberable,
         :validatable
end
