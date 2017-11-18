class CreateAmenityLists < ActiveRecord::Migration
  def change
    create_table :amenity_lists do |t|
      t.boolean :wifi
      t.boolean :couch
    end
  end
end
