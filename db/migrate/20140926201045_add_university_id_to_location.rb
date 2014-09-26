class AddUniversityIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :university_id, :integer
  end
end
