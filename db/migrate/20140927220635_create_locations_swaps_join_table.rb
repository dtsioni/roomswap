class CreateLocationsSwapsJoinTable < ActiveRecord::Migration
  create_table :locations_swaps, id: false do |t|
      t.integer :incoming_swap_id
      t.integer :destination_id
    end
end
