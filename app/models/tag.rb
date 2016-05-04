class Tag < ApplicationRecord
  has_many :taggings
  has_many :photos, through: :taggings

  pg_search_scope :search, :against => :name
end
