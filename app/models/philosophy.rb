class Philosophy < ApplicationRecord
  belongs_to :user
  validates_presence_of :words
end
