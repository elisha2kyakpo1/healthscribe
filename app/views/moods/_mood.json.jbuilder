json.extract! mood, :id, :name, :comment, :time, :date, :symptom_id, :created_at, :updated_at
json.url mood_url(mood, format: :json)
