json.extract! symptom, :id, :name, :intensity, :time, :date, :comment, :user_id, :created_at, :updated_at
json.url symptom_url(symptom, format: :json)
