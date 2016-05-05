class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :preps
  has_attached_file :avatar, styles: { medium: "300X300#", thumb: "100x100#" }
  validates :avatar, attachment_presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 3.megabytes
  validates :name, :email, :gender, :age, :height, presence: true
  validates :age, :height, numericality: true
  validates :email, uniqueness: true
  validate :email_is_valid_format
  validate :password_might_not_be_completely_terrible
  before_validation :downcase_email
  # before_save :set_default_avatar

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  private

  def email_is_valid_format
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

  def downcase_email
    email.downcase! if email
  end

  def password_might_not_be_completely_terrible
    errors.add(:password, "Password must contain at least four unique characters") unless self.password.split('').uniq.length >= 4
  end

  # def set_default_avatar
  #    self.avatar ||= "https://unsplash.it/400/?image=1061"
  # end

end
