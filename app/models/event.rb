class Event < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    has_many :comments, dependent: :destroy
    belongs_to :community
    mount_uploader :event_image, EventImageUploader
end
