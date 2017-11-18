class AddAvailableTimeToUsers < ActiveRecord::Migration
  def change
      add_column :users, :available_time, :string
  end
end
