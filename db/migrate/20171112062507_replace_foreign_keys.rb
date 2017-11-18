class ReplaceForeignKeys < ActiveRecord::Migration
  def change
      remove_foreign_key :users, :amenity_lists
      add_foreign_key :users, :amenity_lists, on_delete: :cascade
      remove_foreign_key :amenity_lists, :users
      add_foreign_key :amenity_lists, :users, on_delete: :cascade
  end
end
