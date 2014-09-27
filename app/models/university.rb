class University < ActiveRecord::Base
  has_many :users
  has_many :locations
  validates_uniqueness_of :name
end