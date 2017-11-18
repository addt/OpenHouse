class RemoveAmenitiesFromUser < ActiveRecord::Migration
  def change
      remove_column :users, :amenities
  end
end
