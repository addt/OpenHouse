class ChangeAmenitiesToStringHash < ActiveRecord::Migration
  def change
      change_column :users, :amenities, :string, array: false
  end
end
