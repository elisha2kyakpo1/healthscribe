class Medication < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_rich_text :comment
  EDITABLE_ATTRS = %i[comment name date time].freeze
end
