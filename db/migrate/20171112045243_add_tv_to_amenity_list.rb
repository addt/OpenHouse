class AddTvToAmenityList < ActiveRecord::Migration
  def change
      add_column :amenity_lists, :tv, :boolean
  end
end
