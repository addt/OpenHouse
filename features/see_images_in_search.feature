# Pivotal Tracker ID: 151973833
Feature: Users can see pictures in search
    As a user who wants to rent a space
    So that I can decide which places interest me
    I want to see pictures of my options

Background: added user accounts, each having the default house and profile picture
  Given the following accounts exist:
      | email                   | password   | home_street_address  | home_city    | home_state     | home_zip_code    | first_name | last_name | credit_card_number | expiration_date | cvv | searchable | price |
      | aladdin@agrabah.com     | 12341001   | Agrabah Dessert      | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 | true       | 5     |
      | terminator@future.com   | password   | 1234 Robots Factory  | New Berkeley | New California | 76767            | Terminator | T-800     | 2222222222222222   | 26-Oct-2017     | 222 | true       | 10    |
      | howl@royal_wizard.com   | hocuspocus | Howl's Moving Castle | Kingsbury    | Ingary         | 34567            | Howl       | Pendragon | 0987665432109876   | 17-Mar-2024     | 783 | true       | 16    |
  Given I log in with email "howl@royal_wizard.com" and password "hocuspocus"

Scenario: user can see pictures in the search results
    Given I am on the home page
    When I press "Search"
    Then I should see a default house image

Scenario: user can see pictures he just uploaded in the search results
    Given I am on the edit profile page for "howl@royal_wizard.com" 
    And I upload "user.png" as my "house_picture"
    Then I go to the home page
    And I press "Search"
    Then I should see a "user.png" image
