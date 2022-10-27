json.extract! medication, :id, :name, :comment, :time, :date, :symptom_id, :created_at, :updated_at
json.url medication_url(medication, format: :json)
