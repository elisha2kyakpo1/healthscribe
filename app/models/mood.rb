class Mood < ApplicationRecord
  belongs_to :user
  has_rich_text :comment
  enum :mood, %i[😊 🙂 😑 ☹️ 😦]
end
