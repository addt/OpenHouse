class AddAmenitiesToUsers < ActiveRecord::Migration
  def change
      add_column :users, :amenities, :string, array: true, default: []
  end
end
