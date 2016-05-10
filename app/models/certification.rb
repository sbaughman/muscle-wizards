class Certification < ApplicationRecord
  belongs_to :user
  validates :name, :date_granted, presence: true
end
