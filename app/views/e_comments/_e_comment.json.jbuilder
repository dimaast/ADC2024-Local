json.extract! e_comment, :id, :body, :user_id, :event_id, :created_at, :updated_at
json.url e_comment_url(e_comment, format: :json)
