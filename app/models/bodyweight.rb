class Bodyweight < ApplicationRecord
  belongs_to :prep
  validates :weight, presence: true, numericality: true
  before_save :multiply_by_ten

  def display_weight
    weight / 10.0
  end
  
  private

  def multiply_by_ten
    self.weight = weight * 10
  end

end
