class AddNameToUniversity < ActiveRecord::Migration
  def change
    add_column :universities, :name, :string
  end
end
