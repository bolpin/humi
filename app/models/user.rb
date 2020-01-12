class User < ApplicationRecord
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
