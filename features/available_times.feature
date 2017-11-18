Feature: Users inputting space availability for rental spaces
  As a User,
  So that I can get my space rented,
  I want to be able to input times I have available for the next two weeks.
    

Background: user accounts have been added to database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Oakland      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |
    And I am on the home page
    
Scenario: host can go to edit space availability
  Given I log in with email "aladdin@agrabah.com" and password "12341001"
  And I follow "Edit Profile"
  When I fill in "user[available_time_start]" with "12:00"
  And I fill in "user[available_time_end]" with "17:00"
  And I press "Save Changes"
  Then I should see "12:00 p.m. - 5:00 p.m."
  
Scenario: User can create an account with account with availability information
  Given I am on the home page
  When I follow "Sign Up"
  And I fill in "E-mail Address" with "dave101@gmail.com"
  And I fill in "Password" with "12345678"
  And I press "Submit"
  And I fill in "user_billing_first_name" with "Davey"
  And I fill in "user_billing_last_name" with "Dave"
  And I press "Submit"
  And I fill in "user_home_city" with "Dave's City"
  And I fill in "user[available_time_start]" with "12:00"
  And I fill in "user[available_time_end]" with "17:00"
  And I press "Submit"
  Then I should be on the home page
  And account with email "dave101@gmail.com" should exist