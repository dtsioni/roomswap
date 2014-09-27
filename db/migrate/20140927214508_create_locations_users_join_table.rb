class CreateLocationsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :locations_users, id: false do |t|
      t.integer :migrator_id
      t.integer :target_id
    end
  end
end
