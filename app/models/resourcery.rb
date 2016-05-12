class Resourcery < ApplicationRecord
  belongs_to :prep
  belongs_to :resource

  validates_uniqueness_of :resource_id, :scope => :prep_id
end
