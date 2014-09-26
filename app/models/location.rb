class Location < ActiveRecord::Base
  belongs_to :university
  has_many :residents, class_name: "User",
    foreign_key: "home_id"
  has_and_belongs_to_many :migrators, class_name: "User",
    foreign_key: "migrator_id"
  has_many :swaps

end