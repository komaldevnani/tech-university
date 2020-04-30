class Student < ActiveRecord::Base
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\Z/i
  validates :email, presence: true, length: {maximum: 105},
            uniqueness: {case_sensitive: false}, format: { with: VALID_EMAIL_REGEX}
  has_secure_password
end