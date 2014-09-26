class CreateJoinTableLocationUser < ActiveRecord::Migration
  def change
    create_join_table :locations, :users do |t|
      t.integer :target_id
      t.integer :migrator_id
    end
  end
end
