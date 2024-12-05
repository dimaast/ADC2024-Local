class Meet < ApplicationRecord
  belongs_to :user
  has_many :m_comments, dependent: :destroy
end
