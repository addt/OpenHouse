# Pivotal Tracker ID: 151973900
Feature: Guest wants to see list of spaces available near him or her

    As a Guest,
    So that I can search for rental offers,
    I want to see a map of all rental offers when I search.
    
Background: a user has been created in the database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    Given I log in with email "aladdin@agrabah.com" and password "12341001"
    And I am on the home page

Scenario: Search and see results in a map
  When I press "Search"
  Then I should see a map
