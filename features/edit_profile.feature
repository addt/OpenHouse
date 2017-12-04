# Pivotal Tracker ID: 151974164
Feature: User can view and edit profile information
  As a user
  So that I can change information about myself or correct a mistake
  I want to be able to edit my profile
  
Background: user accounts have been added to database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |
    And I log in with email "aladdin@agrabah.com" and password "12341001"
    And I am on the home page

Scenario: Edit Profile Information
  Given I follow "Edit Profile"
  Then I should be on the edit page
  And I fill in "user_billing_street_address" with "Real Address"
  And I fill in "user_billing_city" with "Real City"
  And I fill in "user_billing_state" with "Liquid State"
  And I fill in "user_billing_zip_code" with "77877"
  And I fill in "user_billing_first_name" with "Reyal"
  And I fill in "user_billing_last_name" with "Pearson"
  And I fill in "Credit Card Number" with "7777777777777777"
  And I fill in "Expiration Date" with "31-Dec-9999"
  And I fill in "CVV" with "777"
  And I press "Save Changes"
  
  And I follow "Edit Profile"
  Then I should be on the edit page
  And the "user_first_name" field should contain "Ali"
  And the "user_last_name" field should contain "Ababwa"
  And the "user_billing_first_name" field should contain "Reyal"
  And the "user_billing_last_name" field should contain "Pearson"
  And the "user_billing_street_address" field should contain "Real Address"
  And the "user_billing_city" field should contain "Real City"
  And the "user_billing_state" field should contain "Liquid State"
  And the "user_billing_zip_code" field should contain "77877"
  And the "user_credit_card_number" field should contain "7777777777777777"
  And the "user_expiration_date" field should contain "31-Dec-9999"
  And the "user_cvv" field should contain "777"
