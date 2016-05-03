class TargetMacro < ApplicationRecord
  belongs_to :prep
  validates :protein, :carbs, :fat, presence: true
  validates :protein, :carbs, :fat, numericality: true
  validates :fiber, numericality: true, allow_blank: true
end
