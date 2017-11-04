# Pivotal Tracker ID: 151973802
Feature: User Login
    As a User
    So that I can manage my account
    And interact with OpenHouse
    I want to be able to log in
    And I don't want others to log in
    
Background: a user has been created in the database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |

Scenario: Host can log in with correct credentials
    Given I am on the login page
    And I fill in "Email" with "aladdin@agrabah.com"
    And I fill in "Password" with "12341001"
    When I press "Log In" 
    Then I should see "Edit Profile"
    And I should not see "Log In"
    And I should see "Log Out"

Scenario: Host cannot log in with incorrect email
    Given I am on the login page
    And I fill in "Email" with "jonathan@gmail.com"
    When I press "Log In" 
    Then I should see an error message
    And I should see "Log In"
    And I should not see "Log Out"
    
Scenario: Host cannot log in with incorrect password
    Given I am on the login page
    And I fill in "Password" with "12345679"
    When I press "Log In" 
    Then I should see an error message
    And I should see "Log In"
    And I should not see "Log Out"

Scenario: Host cannot log in with incorrect email and password
    Given I am on the login page
    And I fill in "Email" with "jonathan@gmail.com"
    And I fill in "Password" with "12345679"
    When I press "Log In"
    Then I should see "Invalid email/password combination"
    And I should see "Log In"
    And I should not see "Log Out"

Scenario: Host cannot log in if already logged in
    Given I am on the login page
    And I fill in "Email" with "aladdin@agrabah.com"
    And I fill in "Password" with "12341001"
    When I press "Log In" 
    Then I should not see "Log In"
