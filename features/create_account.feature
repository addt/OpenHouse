# Pivotal Tracker ID: 152378125
Feature: Account Creation
    As a human
    So that I can start using OpenHouse
    I want to create an OpenHouse account
    And take it one step at a time to not be overwhelmed.

Background: accounts have been added to database
  Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    | terminator@future.com   | password | 1234 Robots Factory    | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 |

Scenario: Human can create an account with an unused email
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    Then I press "Submit"
    And I should see "dave101@gmail.com was successfully created."
    And account with email "dave101@gmail.com" should exist

Scenario: Human cannot create an account with a used email
    Given I am on the home page
    When I follow "Login"
    When I follow "Sign up now!"
    And I fill in "E-mail Address" with "aladdin@agrabah.com"
    And I fill in "Password" with "12345678"
    Then I press "Submit"
    And I should see "email has already been taken"
    And account with email "aladdin@agrabah.com" should exist

Scenario: Human cannot create an account with a blank email
    Given I am on the home page
    When I follow "Login"
    When I follow "Sign up now!"
    And I fill in "E-mail Address" with ""
    And I fill in "Password" with "12345678"
    Then I press "Submit"
    And I should see "email can't be blank"

Scenario: Human cannot create an account with a short password
    Given I am on the home page
    When I follow "Login"
    When I follow "Sign up now!"
    And I fill in "E-mail Address" with "aladdin@agrabah.com"
    And I fill in "Password" with "1234"
    Then I press "Submit"
    And I should see "password is too short"
    And account with email "aladdin@agrabah.com" should not exist
    
Scenario: Multiple errors
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "Password" with "1234"
    Then I press "Submit"
    And I should see "email can't be blank"
    And I should see "password is too short"

Scenario: Human can create an account with some account information
    Given I am on the home page
    When I follow "Sign Up"
    Then I should see "account information"
    And I should not see "Billing Information"
    And I should not see "Hosting Information"

Scenario: Human can create an account with account and add billing info if desired
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    And I press "Submit"
    Then I should not see "Account Information"
    And I should see "Billing Information"
    And I should see "Skip"

Scenario: Human can create an account with account without any other information
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    And I press "Submit"
    And I follow "Skip"
    Then I should be on the home page
    And account with email "dave101@gmail.com" should exist
    
Scenario: Human can create an account with account with billing information and put in hosting info if desired
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    And I press "Submit"
    And I fill in "user_billing_first_name" with "Davey"
    And I fill in "user_billing_last_name" with "Dave"
    And I press "Submit"
    Then I should not see "Account Information"
    And I should not see "Billing Information"
    And I should see "Hosting Information"
    And account with email "dave101@gmail.com" should exist

Scenario: Human can create an account with account with billing information and put in hosting info if desired
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    And I press "Submit"
    And I fill in "user_billing_first_name" with "Davey"
    And I fill in "user_billing_last_name" with "Dave"
    And I press "Submit"
    And I follow "Skip"
    Then I should be on the home page
    And account with email "dave101@gmail.com" should exist

Scenario: Human can create an account with account with billing and hosting information
    Given I am on the home page
    When I follow "Sign Up"
    And I fill in "E-mail Address" with "dave101@gmail.com"
    And I fill in "Password" with "12345678"
    And I press "Submit"
    And I fill in "user_billing_first_name" with "Davey"
    And I fill in "user_billing_last_name" with "Dave"
    And I press "Submit"
    And I fill in "user_home_city" with "Dave's City"
    And I press "Submit"
    Then I should be on the home page
    And account with email "dave101@gmail.com" should exist
