class Symptom < ApplicationRecord
  belongs_to :user
  INTENSITY = %i[stomach_ache diarrhea cosntipation headache nausea fever vomiting].freeze
end
