class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :preps, dependent: :destroy
  has_attached_file :avatar, styles: { medium: "300X300#", thumb: "100x100#" }
  has_many :certifications, dependent: :destroy
  has_one :philosophy, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :resources, dependent: :destroy
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 3.megabytes
  validates :name, :email, presence: true
  validates :age, :height, numericality: true, allow_blank: true
  validates :email, uniqueness: true
  validate :email_is_valid_format
  before_validation :downcase_email
  before_save :set_default_avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  private

  def email_is_valid_format
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

  def downcase_email
    email.downcase! if email
  end

  def set_default_avatar
    self.avatar = URI.parse("https://unsplash.it/400/?image=1061") if avatar.blank?
  end

end
