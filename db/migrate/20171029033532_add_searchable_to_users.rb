class AddSearchableToUsers < ActiveRecord::Migration
  def change
    add_column :users, :searchable, :bool
  end
end
