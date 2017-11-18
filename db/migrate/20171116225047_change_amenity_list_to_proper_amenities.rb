class ChangeAmenityListToProperAmenities < ActiveRecord::Migration
  def change
    remove_column :amenity_lists, :couch
    remove_column :amenity_lists, :tv
    add_column :amenity_lists, :coffee,         :boolean
    add_column :amenity_lists, :computer_desk,  :boolean
    add_column :amenity_lists, :printer,        :boolean
    add_column :amenity_lists, :projector,      :boolean
    add_column :amenity_lists, :microwave,      :boolean
    add_column :amenity_lists, :kitchen_access, :boolean
    add_column :amenity_lists, :tv_screen,      :boolean
    add_column :amenity_lists, :outdoor_space,  :boolean
    add_column :amenity_lists, :piano,          :boolean
    add_column :amenity_lists, :art_space,      :boolean
    add_column :amenity_lists, :garage,         :boolean
  end
end
