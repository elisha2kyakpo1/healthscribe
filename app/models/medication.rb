class Medication < ApplicationRecord
  belongs_to :user
  has_rich_text :comment
  EDITABLE_ATTRS = %i[comment name date time]
end
