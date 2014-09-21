class User < ActiveRecord::Base

  before_save{ self.email = email.downcase }

  validates :name, length: {maximum: 20, minimum: 3}, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

  validates :email, presence: true
end