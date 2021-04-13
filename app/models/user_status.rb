class UserStatus < ApplicationRecord
  validates :body, presence: true
end
