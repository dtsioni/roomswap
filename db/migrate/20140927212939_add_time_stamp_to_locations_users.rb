class AddTimeStampToLocationsUsers < ActiveRecord::Migration
  def change_table
    add_column(:locations_users, :created_at, :datetime)
    add_column(:locations_users, :updated_at, :datetime)
  end
end
