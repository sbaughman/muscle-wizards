class Photo < ApplicationRecord
  belongs_to :prep
  validates :avatar, attachment_presence: true
end
