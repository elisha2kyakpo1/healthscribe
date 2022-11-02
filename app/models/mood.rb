class Mood < ApplicationRecord
  belongs_to :user
  enum :mood, %i[😊 🙂 😑 ☹️ 😦]
end
