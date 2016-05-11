class Resource < ApplicationRecord
  belongs_to :user
  has_attached_file, :upload
  validates :title, presence: true
  validate :any_present?

  private
  
  def any_present?
  end
end
