class CreateLocationsUsers < ActiveRecord::Migration
  def change
    create_table :locations_users, id: false do |t|
      t.integer :target_id
      t.integer :migrator_id
    end
  end
end