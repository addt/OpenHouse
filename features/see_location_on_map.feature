# Pivotal Tracker ID: 151974069

Feature: Guest wants to see location of a search result
    As a Guest,
    So I can see if a rental space is good for me,
    I want to see its location on a map.
  
Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address  | home_city      | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 2634 Virginia Street | Berkeley       | CA          | 94709         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |

Scenario: Click a search result and see its location
  Given I am on the home page
  And I fill in "location_city" with "Berkeley"
  And I press "Search"
  # When I click a post with id "link_2634 Virginia Street" # For future reference
  # Then I should see "Personal Description" 
  And I should see a map
  And the location of "Ali" should be correct # Test not implemented correctly, see map_steps.rb
