class AddImageFields < ActiveRecord::Migration
  def change
    add_column :users, :profile_picture, :string
    add_column :users, :house_picture, :string
    add_column :users, :house_images, :string, array: true, default: []
  end
end
