class Mood < ApplicationRecord
  belongs_to :user
  enum :mood, %i[😊 🙂 😑 ☹️ 😦]
  MY_MOOD = %i[😊 🙂 😑 ☹️ 😦].freeze
end
