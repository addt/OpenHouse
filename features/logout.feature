# Pivotal Tracker ID: 151973802
Feature: User Logout
    As a User
    So that I can have a life
    I want to be able to log out
    
Background: a user has been created in the database
    Given the following accounts exist:
      | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv |
      | dave@gmail.com          | 12345678 | 2700 Mars              | Berkeley     | California     | 94720            | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 |

Scenario: Host can log out after being logged in
    Given I log in with email "dave@gmail.com" and password "12345678"
    And I am on the home page
    When I follow "Log Out"
    Then I should see "Logged Out"
    And I should not be logged in

# Scenario: Host cannot log out if he already logged out in another tab
#    Given I am logged in
#    And I have OpenHouse open in two browser tabs
#    And I am on the OpenHouse home page
#    And I press the "Log Out" button in one of the browser tabs
#    Then I should be logged out
#    And when I attempt to log out from the other tab
#    Then I should be taken to the main page
#    And I should be logged out

Scenario: Host cannot log out if not logged in
    Given that I should not be logged in
    And I am on the home page
    Then I should not see "Log Out"
