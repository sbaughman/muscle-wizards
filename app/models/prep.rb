class Prep < ApplicationRecord
  belongs_to :user
  has_many :bodyweights, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :cardios, dependent: :destroy
  has_many :target_cardios, dependent: :destroy
  has_many :contests, dependent: :destroy
  has_many :macros, dependent: :destroy
  has_many :target_macros, dependent: :destroy
  has_one :invitation, dependent: :destroy
  accepts_nested_attributes_for :contests, :allow_destroy => true
  validates :title, presence: true
end
