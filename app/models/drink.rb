class Drink < ApplicationRecord
  has_rich_text :comment
  belongs_to :user
  validates :name, presence: true
  EDITABLE_ATTRS = %i[comment name date time].freeze
end
