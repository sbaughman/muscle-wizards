class Tagging < ApplicationRecord
  belongs_to :photos
  belongs_to :tags
end
