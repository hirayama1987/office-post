json.extract! question, :id, :question, :answer, :status, :created_at, :updated_at
json.url question_url(question, format: :json)
