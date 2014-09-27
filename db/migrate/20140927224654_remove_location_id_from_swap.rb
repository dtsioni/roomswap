class RemoveLocationIdFromSwap < ActiveRecord::Migration
  def change
    remove_column :swaps, :location_id
  end
end
