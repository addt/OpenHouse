# Pivotal Tracker ID: 152302672
Feature: Profiles can be potentially be searched for
    As a user of the OpenHouse,
    So that I can have my space rented,
    I want to be able to toggle whether my profile is searchable or not.

Background: a user has been created in the database
    Given the following accounts exist:
      | email          | password | home_street_address | home_city         | home_state         | home_zip_code | first_name | last_name | credit_card_number   | expiration_date | cvv |
      | dave@gmail.com | 12345678 | 2700 Mars           | Berkeley          | California         | 94720         | Dave       | Schiller  | 12341234123412341234 | 6/22            | 511 |

Scenario: account initially not searchable
    Given I am on the homepage
    And I press "Search"
    Then I should not see "2700 Mars"
    
Scenario: Make account searchable
    Given I log in with email "dave@gmail.com" and password "12345678"
    And I am on the edit page
    Then I check "searchable"
    Then I press "Save Changes"
    And I am on the homepage
    And I press "Search"
    Then I should see "2700 Mars"

Scenario: Make account not searchable
  Given account with email "dave@gmail.com" is searchable
  And I log in with email "dave@gmail.com" and password "12345678"
  And I am on the edit page
  Then I uncheck "searchable"
  Then I press "Save Changes"
  And I am on the homepage
  And I press "Search"
  Then I should not see "2700 Mars"
