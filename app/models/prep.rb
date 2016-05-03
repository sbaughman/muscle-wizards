class Prep < ApplicationRecord
  belongs_to :user
  has_many :bodyweights
  has_many :photos
  has_many :cardios
  has_many :target_cardios
  has_many :contests
  has_many :macros
  has_many :target_macros
  validates :title, presence: true

  def time_til_contest
    time = contests.first.date - Time.now
    if time >= 604800
      weeks = (time / 604800).round(1)
      return weeks, "week"
    else
      days = (time / 86400).to_i
      return days, "day"
    end
  end
end
