class Certification < ApplicationRecord
  belongs_to :user
  validates :name, :date_granted, presence: true
  validate :is_in_the_future

  def is_in_the_future
    if self.date_granted && self.date_granted > Time.now
      errors.add(:date_granted, "can't be a future date")
    end
  end
end
