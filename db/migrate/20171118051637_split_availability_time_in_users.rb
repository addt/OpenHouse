class SplitAvailabilityTimeInUsers < ActiveRecord::Migration
  def change
    change_table :users do |u|
      u.rename :available_time, :available_time_start
    end
    add_column :users, :available_time_end, :string
  end
end
