# Pivotal Tracker ID: 151973839
Feature: User deletes account
  As a OpenHouse User
  So that I can stop using OpenHouse
  I want to delete my account
  
Background: a user has been created in the database
  Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |

Scenario: delete account
  Given I am on the login page
  And I fill in "Email" with "aladdin@agrabah.com"
  And I fill in "Password" with "12341001"
  When I press "Log In"
  And I follow "Edit Profile"
  And I should be on the edit page
  When I press "Delete Profile"
  Then I should see "Your account has been deleted."
  And account with email "aladdin@agrabah.com" should not exist in the database
