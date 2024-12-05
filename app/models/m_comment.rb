class MComment < ApplicationRecord
  belongs_to :meet
  belongs_to :user

  after_create_commit { broadcast_prepend_to("e_meets") }
end
