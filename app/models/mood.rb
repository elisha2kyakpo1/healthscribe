class Mood < ApplicationRecord
  belongs_to :symptom
  enum :mood, %i[😊 🙂 😑 ☹️ 😦]
end
