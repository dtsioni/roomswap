class RemoveTimeStampFromLocationsUsers < ActiveRecord::Migration
  def change_table
    remove_column(:locations_users, :created_at, :datetime)
    remove_column(:locations_users, :updated_at, :datetime)
  end
end
