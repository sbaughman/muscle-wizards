class Philosophy < ApplicationRecord
  belongs_to :user
  validates_presence_of :words
  validates :words, length: { maximum: 2000 }
end
