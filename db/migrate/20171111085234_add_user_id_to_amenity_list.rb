class AddUserIdToAmenityList < ActiveRecord::Migration
  def change
      add_column :amenity_lists, :user_id, :integer
      add_foreign_key :amenity_lists, :users
  end
end
