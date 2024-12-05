class EComment < ApplicationRecord
  belongs_to :event
  belongs_to :user

  after_create_commit { broadcast_prepend_to("e_comments") }

  default_scope { order(created_at: :desc) }
end
