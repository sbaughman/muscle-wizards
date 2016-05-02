class Contest < ApplicationRecord
  validates :title, :date, presence: true
end
