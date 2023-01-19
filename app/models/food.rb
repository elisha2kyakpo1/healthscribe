class Food < ApplicationRecord
  has_rich_text :comment
  belongs_to :user
  EDITABLE_ATTRS = %i[comment name date time]
end
