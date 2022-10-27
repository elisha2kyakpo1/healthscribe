class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :symptoms
  has_many :medications, through: :symptoms
  has_many :moods, through: :symptoms
  has_many :foods, through: :symptoms
  has_many :drinks, through: :symptoms
end
