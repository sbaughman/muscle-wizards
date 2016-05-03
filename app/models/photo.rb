class Photo < ApplicationRecord
  belongs_to :prep
  validates :image, attachment_presence: true
end
