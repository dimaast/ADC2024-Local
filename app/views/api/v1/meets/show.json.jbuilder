json.extract! @meet, :id, :body, :date_hosted, :geotag, :user_id, :created_at, :updated_at

json.set! :m_comments do
  json.array! @meet.m_comments, partial: "api/v1/meets/m_comment", as: :m_comment
end
