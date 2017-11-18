# Pivotal Tracker ID: 152366073
Feature: Users can see more pictures by going to the user's profile
    As a user who wants to rent a house
    So that I can better decide if I like an option
    I want to be able to see more photos of it

Background: user accounts, and more_pictures are in the alladin's database
  Given the following accounts exist:
    | email                   | password   | home_street_address | home_city     | home_state  | home_zip_code | house_description   | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
    | aladdin@agrabah.com     | 12341001   | 101 Agrabah Dessert | Agrabah       | ME          | 10101         | Big and extravagant | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 16    |
  Given I log in with email "aladdin@agrabah.com" and password "12341001"
  And I am on the edit profile page for "aladdin@agrabah.com"
  And I upload "user.png" as my "more_picture"
  And I upload "invalid.file" as my "more_picture"
  And I upload "house.jpg" as my "more_picture"
  And I am on the home page
  Then I follow "Log Out"
  
Scenario: user see them in his profile page
    Given I log in with email "aladdin@agrabah.com" and password "12341001"
    When I am on the user profile page for "aladdin@agrabah.com"
    Then I should see "2" more pictures of the rental space
    And I should not see "3" pictures of the rental space

Scenario: other users can see uploaded pictures in user profile page
    Given I should not be logged in
    And I am on the user profile page for "aladdin@agrabah.com"
    Then I should see "2" more pictures of the rental space
    And I should not see "3" pictures of the rental space
