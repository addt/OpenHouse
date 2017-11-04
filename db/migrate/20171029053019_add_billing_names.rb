class AddBillingNames < ActiveRecord::Migration
  def change
    add_column :users, :billing_first_name, :string
    add_column :users, :billing_last_name, :string
  end
end
