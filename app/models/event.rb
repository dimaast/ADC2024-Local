class Event < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    belongs_to :user
    belongs_to :community
    has_many :comments, dependent: :destroy
    mount_uploader :event_image, EventImageUploader
end
