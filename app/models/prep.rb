class Prep < ApplicationRecord
  belongs_to :user
  has_many :bodyweights
  has_many :photos
  has_many :cardios
  has_many :contests
  has_many :macros
  validates :title, presence: true

  def weeks_til_contest
    contests.first.date - Time.now
  end
end
