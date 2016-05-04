class Photo < ApplicationRecord
  belongs_to :prep
  has_one :tag, through: :tagging
  has_one :tagging, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
  validates :image, attachment_presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :image, less_than: 3.megabytes
end
