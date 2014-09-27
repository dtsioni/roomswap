class Swap < ActiveRecord::Base
  belongs_to :user
  belongs_to :origin, class_name: "Location",
    foreign_key: "origin_id"
  has_and_belongs_to_many :destinations, class_name: "Location",
    join_table: "locations_swaps", foreign_key: "destination_id",
    association_foreign_key: "incoming_swap_id"
  validates_uniqueness_of :user_id    
end