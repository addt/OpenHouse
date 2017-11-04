# Pivotal Tracker ID: 151974069
Feature: Guest wants to see location of a search result

    As a Guest,
    When I click on a search result,
    So I can see if a rental space is good for me,
    I want to see its address
    And I want to see its location on a map.
    
Scenario: Click a search result and see its location
  Given I am a Guest
  When I click on "Search Result"
  Then I should be on the "Search Result Details" page
  And I should see "Address"
  And I should see a location on "Map"
