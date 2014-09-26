class Swap < ActiveRecord::Base
  belongs_to :user
  belongs_to :origin, class_name: "Location",
    foreign_key: "origin_id"
  belongs_to :destination, class_name: "Location",
    foreign_key: "destination_id"
    
end