class AddUserIdToSwap < ActiveRecord::Migration
  def change
    add_column :swaps, :user_id, :integer
  end
end
