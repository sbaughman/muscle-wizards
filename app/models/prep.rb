class Prep < ApplicationRecord
  has_many :bodyweights
  has_many :photos
  has_many :cardios
  has_many :contests
  has_many :macros
  validates :title, presence: true
end
