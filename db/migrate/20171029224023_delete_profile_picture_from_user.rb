class DeleteProfilePictureFromUser < ActiveRecord::Migration
  def change
      remove_column :users, :profile_picture, :string
      remove_column :users, :house_picture, :string
  end
end
