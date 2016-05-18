class Bodyweight < ApplicationRecord
  belongs_to :prep
  validates :weight, presence: true
  validates :weight, numericality: { greater_than: 50, less_than: 500, message: "Value must be between 50 and 500" }

  def display_weight
    weight / 10.0
  end

end
