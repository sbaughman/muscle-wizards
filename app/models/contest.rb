class Contest < ApplicationRecord
  belongs_to :prep
  validates :title, :date, presence: true
  # before_validation :format_time

  def format_time
    self.date += " 00:00:00"
  end
end

# 05/19/2016
# 2016-07-28 14:27:30
