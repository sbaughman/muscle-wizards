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

end
