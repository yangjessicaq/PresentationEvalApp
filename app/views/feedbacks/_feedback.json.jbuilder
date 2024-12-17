json.extract! feedback, :id, :presentation_id, :commentor_id, :comments, :grades, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
