class Symptom < ApplicationRecord
  belongs_to :user
  validates :headache, :fever, :stomach_ache, :diarrhea, :vomiting, :nausea, presence: true,
                                                                             numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
