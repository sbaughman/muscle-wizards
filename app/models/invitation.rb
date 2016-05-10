class Invitation < ApplicationRecord
  belongs_to :prep
  belongs_to :user
end
