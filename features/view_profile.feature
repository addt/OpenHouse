# Pivotal Tracker ID: 152529390
Feature: User can view profile information
  
  As a user
  So that I can see what other users see on my profile
  I want to be able to view my profile
  
Background: user accounts have been added to database, and posts are made

  Given the following accounts exist:
  | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
  | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
  | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |
  And I log in with email "aladdin@agrabah.com" and password "12341001"
  And I am on the home page

Scenario: View Profile Information
  Given I follow "View Profile"
  Then I should be on the user profile page for user "aladdin@agrabah.com"
  Then I should see "aladdin@agrabah.com"
  Then I should see "Ali"
  Then I should see "Ababwa"
  Then I should see "Agrabah Dessert"
  Then I should see "Agrabah"
  Then I should see "Middle East"
  Then I should see "10101"
  Then I should see "1234567812345678"
  Then I should see "25-Nov-2300"
  Then I should see "101"
