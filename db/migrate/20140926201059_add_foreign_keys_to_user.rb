class AddForeignKeysToUser < ActiveRecord::Migration
  def change
    add_column :users, :university_id, :integer
    add_column :users, :home_id, :integer
  end
end
