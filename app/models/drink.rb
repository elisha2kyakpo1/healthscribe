class Drink < ApplicationRecord
  belongs_to :user
  EDITABLE_ATTRS = %i[comment name date time]
end
