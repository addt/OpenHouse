# Pivotal Tracker ID: 151973931
Feature: User can see another user's available times
  As a user
  So that I can change rent my space
  I want users to be able to see my availability
  
Background: user accounts have been added to database
    Given the following accounts exist:
        | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv | available_time_start | available_time_end | searchable | price |
        | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | 06:00                | 18:00              |true       | 10    |

Scenario: availability of profile on search results
  Given I am on the home page
  When I press "Search"
  Then I should see "Available:"
  And I should see "6:00-18:00"

# Scenario: availability of profile on the profile page
#   Given I am on the home page
#   When I press "Search"
#   And I follow "See More"
#   Then I should see "Times Available:"
#   And I should see "6:00-18:00"
  