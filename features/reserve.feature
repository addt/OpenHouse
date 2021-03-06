Feature: Make Reservation
    As a User
    So that I can reserve a space
    I want to be able to make a reservation request
    
Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 3845 Market Street  | Oakland       | CA          | 94608         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |
    | terminator@future.com   | password   | 1234 Robots Factory | New Berkeley  | NCA         | 76767         | Compact             | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 | false      | 200   |

  And I log in with email "terminator@future.com" and password "password"
  And I am on the home page
  
Scenario: User can reserve other user's space
  Given I fill in "search-bar" with "Oakland"
  And I press "Search"
  When I click a post with id "link_3845 Market Street"
  Then I should see "3845 Market Street"
  And I press "Reserve"
  Then I should see a reserve message