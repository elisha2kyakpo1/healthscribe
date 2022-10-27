class Symptom < ApplicationRecord
  belongs_to :user
  has_many :medications
  has_many :moods
  has_many :foods
  has_many :drinks
  validates :name, presence: true
  enum :intensity, %i[stomach_ache diarrhea cosntipation headache nausea fever vomiting]
end
