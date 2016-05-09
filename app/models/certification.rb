class Certification < ApplicationRecord
  validates :name, :date_granted, presence: true
end
