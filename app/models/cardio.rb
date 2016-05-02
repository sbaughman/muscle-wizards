class Cardio < ApplicationRecord
  belongs_to :prep
  validates :duration, :type, :style, presence: true
  validates :duration, numericality: true
end
