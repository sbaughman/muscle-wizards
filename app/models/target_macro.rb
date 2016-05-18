class TargetMacro < ApplicationRecord
  belongs_to :prep
  validates :protein, :carbs, :fat, presence: true
  validates :protein, :carbs, :fat, numericality: { greater_than: 0, less_than: 999, message: "Value must be between 1 and 999" }
  validates :fiber, numericality: true, allow_blank: true


  def calories
    (protein + carbs) * 4 + fat * 9
  end

end
