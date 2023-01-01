class Symptom < ApplicationRecord
  belongs_to :user

  def self.column_name(column_index)
    column_names[column_index]
  end
end
