class Bodyweight < ApplicationRecord
  belongs_to :prep
  validates :weight, presence: true, numericality: true

  def display_weight
    weight / 10.0
  end

end
