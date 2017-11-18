class AddAmenityListToUsers < ActiveRecord::Migration
  def change
      add_column :users, :amenity_list_id, :integer
      add_foreign_key :users, :amenity_lists
  end
end
