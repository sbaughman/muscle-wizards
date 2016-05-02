class Photo < ApplicationRecord
  validates :image, attachment_presence: true
end
