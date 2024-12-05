# json.partial! "api/v1/events/event", event: @event

json.extract! @event, :id, :title, :body

json.set! :comments do
  json.array! @event.comments, partial: "api/v1/events/comment", as: :comment
end