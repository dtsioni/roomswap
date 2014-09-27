class RemoveDestinationIdFromSwap < ActiveRecord::Migration
  def change
    remove_column :swaps, :destination_id
  end
end
