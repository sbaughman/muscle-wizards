class TargetCardio < ApplicationRecord
  belongs_to :prep
  validates :duration, :activity, :style, presence: true
  validates :duration, numericality: { greater_than: 0, less_than: 120, message: "Value must be between 1 and 120" }
end
