json.extract! food, :id, :name, :comment, :time, :date, :symptom_id, :created_at, :updated_at
json.url food_url(food, format: :json)
