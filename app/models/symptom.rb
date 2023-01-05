class Symptom < ApplicationRecord
  belongs_to :user
  validates :headache, :fever, :stomach_ache, :diarrhea, :vomiting, :nausea, presence: true,
                                                                             numericality:
                                            { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def self.column_name(symptom)
    column_names = Symptom.columns.select{ |c| c.type == :integer && !%w[id user_id].include?(c.name) }.map(&:name)
    column_names.select do |column_name|
      symptom.send(column_name) > 0
    end
  end
end
