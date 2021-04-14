class Studio < ApplicationRecord
  has_many :animes, dependent: :destroy
end
