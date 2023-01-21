class Symptom < ApplicationRecord
  belongs_to :user
  has_rich_text :comment
  EDITABLE_ATTRS = %i[comment headache fever stomach_ache diarrhea vomiting nausea date time].freeze
  validates :headache, :fever, :stomach_ache, :diarrhea, :vomiting, :nausea, presence: true,
                                                                             numericality:
                                            { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  def self.column_name(symptom)
    return [] if symptom.nil?

    column_names = Symptom.columns.select { |c| c.type == :integer && !%w[id user_id].include?(c.name) }.map(&:name)
    column_names.select do |column_name|
      symptom.send(column_name).positive?
    end
  end
end
