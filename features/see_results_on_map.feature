# Pivotal Tracker ID: 151973900
Feature: Guest wants to see list of spaces available near him or her

    As a Guest,
    When I search for rental offers,
    I want to see map of all rental offers.
    
Scenario: Search and see results in a map
  Given I am a Guest
  When I search "Event_Type"
  Then I should see a "Map"
  And the "Map" should contain all results.
