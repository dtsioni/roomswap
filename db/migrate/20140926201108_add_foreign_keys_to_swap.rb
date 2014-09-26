class AddForeignKeysToSwap < ActiveRecord::Migration
  def change
    add_column :swaps, :destination_id, :integer
    add_column :swaps, :origin_id, :integer
    add_column :swaps, :location_id, :integer
  end
end
