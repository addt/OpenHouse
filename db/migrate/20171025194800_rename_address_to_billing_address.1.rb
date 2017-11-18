class RenameAddressToBillingAddress < ActiveRecord::Migration
    def change
        change_table :users do |u|
            u.rename :street_address, :billing_street_address
            u.rename :city, :billing_city
            u.rename :state, :billing_state
            u.rename :zip_code, :billing_zip_code
        end
    end
end
