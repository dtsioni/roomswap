class User < ActiveRecord::Base
  belongs_to :university
  belongs_to :home, class_name: "Location",
    foreign_key: "home_id"
  has_and_belongs_to_many :targets, class_name: "Location",
    join_table: "locations_users", foreign_key: "target_id",
     association_foreign_key: "migrator_id"
  has_one :swap
  before_save{ self.email = email.downcase }  
  validates :name, length: {maximum: 20, minimum: 3}, presence: true
  validates :gender, presence: true
  validates :university_id, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :home_id, presence: true, if: :has_swap?
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }, if: ->{password.present?}
  has_secure_password
  def has_swap?
    self.swap ? true : false
  end
end