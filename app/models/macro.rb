class Macro < ApplicationRecord
  belongs_to :prep
  validates :protein, :carbs, :fat, :fiber, presence: true, numericality: true
end
