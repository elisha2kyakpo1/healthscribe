class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :symptoms, dependent: :destroy
  has_many :medications, dependent: :destroy
  has_many :moods, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :drinks, dependent: :destroy
end
