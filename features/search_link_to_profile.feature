# Pivotal Tracker ID: 151974066
Feature: User can click on search results' profile
  As a User
  So that I can know if a rental space is good for me
  I want to be able to click on a search result to see their profile.

Background: user accounts are in the database
  Given the following accounts exist:
    | email                   | password   | home_street_address | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 101 Agrabah Dessert | Agrabah       | ME          | 10101         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |
    | terminator@future.com   | password   | 1234 Robots Factory | New Berkeley  | NCA         | 76767         | Compact             | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 | true       | 200   |
    | shyguy@minion.koopa.com | veryshyguy | Bowser's Castle     | Dark Land     | MK          | 67676         | Non-existent        | Shy        | Guy       | 0020030040050060   | 29-Feb-2020     | 676 |            |       |
    | MISSINGNO@blorp.com     | ihavenot   |                     | Pokemon Tower |             |               |                     |            |           |                    |                 |     | true       |       | 

Scenario: user can search all profiles by not inputting anything
  Given I am on the home page
  When I press "Search"
  Then I should see "101 Agrabah Dessert"
  Then I should see "1234 Robots Factory"
  Then I should see "Pokemon Tower"
  Then I should not see "Bowser's Castle"
  
Scenario: user can view other user's profile using "See More"
  Given I am on the home page
  When I press "Search"
  And I click the first "See More"
  Then I should see "aladdin@agrabah.com"
  And I should not see "Edit Profile"

Scenario: Logged in user can see their own profile in search
  Given I log in with email "aladdin@agrabah.com" and password "12341001"
  Given I am on the home page
  When I press "Search"
  And I click the first "See More"
  Then I should be on the user profile page for "aladdin@agrabah.com"
  And I should see "aladdin@agrabah.com"
  And I should see "Edit Profile"

Scenario: using the search bar to search (note: not tested heavily because we kinda want to change this behavior later)
  Given I am on the home page
  Given I fill in "Address" with "1234 Robots Factory"
  Given I fill in "City" with "New Berkeley"
  Given I fill in "State" with "NCA"
  And I press "Search"
  Then I should see "Compact"
  And I should not see "101 Agrabah Dessert"
  And I follow "See More"
  Then I should be on the user profile page for "terminator@future.com"
