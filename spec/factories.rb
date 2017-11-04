FactoryGirl.define do
    factory :user do
        email "aladdin@agrabah.com"
        password "12341001"
        billing_street_address "Agrabah Dessert"
        billing_city "Agrabah"
        billing_state "Middle East"
        billing_zip_code "10101"
        first_name "Ali"
        last_name "Ababwa"
        credit_card_number "1234567812345678"
        expiration_date "25-Nov-2300"
        cvv "101"
    end
end