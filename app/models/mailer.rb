class Mailer < ApplicationRecord
  validates :email, presence: true
end
