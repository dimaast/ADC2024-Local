json.extract! @event, :id, :title, :body, :user_id, :created_at, :updated_at

json.set! :e_comments do
  json.array! @event.e_comments, partial: "api/v1/events/e_comment", as: :e_comment
end
