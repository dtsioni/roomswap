class DestroyLocationUserTable < ActiveRecord::Migration
  def change
    drop_table :locations_users
  end
end
