# Pivotal Tracker ID: 151973949
Feature: Users can upload images
    As a User who wants to rent my house
    So that I can attract other users and make my home look inviting
    I want to upload images of my space

Background: a user has been created in the database
    Given the following accounts exist:
    | email                   | password | billing_street_address | billing_city | billing_state  | billing_zip_code | first_name | last_name | credit_card_number | expiration_date | cvv |
    | aladdin@agrabah.com     | 12341001 | Agrabah Dessert        | Agrabah      | Middle East    | 10101            | Ali        | Ababwa    | 1234567812345678   | 25-Nov-2300     | 101 |
    Given I log in with email "aladdin@agrabah.com" and password "12341001"
    And I am on the edit profile page for user "aladdin@agrabah.com"

Scenario: user uploads images to house picture
    When I upload "user.png" as my "house_picture"
    Then the "house_picture" should be added to the post

Scenario: user uploads images to profile picture
    When I upload "user.png" as my "profile_picture"
    Then the "profile_picture" should be added to the post

Scenario: user uploads the wrong type of file
    When I upload "invalid.file" as my "profile_picture"
    Then I should see an error with a message containing "image file"
    Then the file should not have been uploaded by "aladdin@agrabah.com"

Scenario: user tries to upload nothing to house picture
    When I press the "upload_house_picture" button
    Then I should see an error with a message containing "Please select" and "first"

Scenario: user tries to upload nothing to profile picture
  When I press the "upload_profile_picture" button
  Then I should see an error with a message containing "Please select" and "first"

Scenario: user replace old photo
  When I upload "user.png" as my "house_picture"
  And I upload "house.jpg" as my "house_picture"
  Then the "house_picture" should be added to the post