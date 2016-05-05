class Macro < ApplicationRecord
  belongs_to :prep
  validates :protein, :carbs, :fat, presence: true
  validates :protein, :carbs, :fat, numericality: true
  validates :fiber, numericality: true, allow_blank: true

  def calories
    (protein + carbs) * 4 + fat * 9
  end

end
