class Cardio < ApplicationRecord
  belongs_to :prep
  validates :duration, :activity, :style, presence: true
  validates :duration, numericality: true
end
