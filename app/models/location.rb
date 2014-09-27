class Location < ActiveRecord::Base
  belongs_to :university
  has_many :residents, class_name: "User",
    foreign_key: "home_id"
  has_and_belongs_to_many :migrators, class_name: "User",
    join_table: "locations_users", foreign_key: "migrator_id",
    association_foreign_key: "target_id"
  has_and_belongs_to_many :incoming_swaps, class_name: "Swap",
    join_table: "locations_swaps", foreign_key: "incoming_swap_id",
    association_foreign_key: "destination_id"
  validates :university_id, presence: true
  validates :campus, presence: true
  validates :floor, absence: true, unless: :building?  
end