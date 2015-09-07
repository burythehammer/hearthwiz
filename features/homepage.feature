@ready
Feature: Home

  User should be able to view home.

  Scenario: Homepage title
    When I open home
    Then I should be on home
    And I should see the text 'HearthWiz'