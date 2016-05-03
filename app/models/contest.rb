class Contest < ApplicationRecord
  belongs_to :prep
  validates :title, :date, presence: true
end
