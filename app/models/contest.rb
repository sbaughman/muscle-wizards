class Contest < ApplicationRecord
  belongs_to :prep
  validates :title, :date, presence: true
  validate :is_in_the_future

  def is_in_the_future
    if self.date && self.date < Time.now
      errors.add(:date, "can't be in the past")
    end
  end
end
