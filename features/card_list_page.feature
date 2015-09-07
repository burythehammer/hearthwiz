@ready
Feature: Card List

  User should be able to view a list of cards which are filtered and organised.

  Background:
    Given the following cards exist:
      | alias  | type   |
      | Card A | Minion |

  Scenario: Title of card list
    When I open the card list
    Then I should see the title 'All Cards'

  Scenario: Card can be navigated to from the card list
    When I open the card list
    And I open the card 'Card A' from the card list
    Then I should be on the card page for 'Card A'

  @smoke
  Scenario: Card information is displayed on the card list
    When I open the card list
    Then I should see the card 'Card A' on the card list
    And the details for "Card A" should be shown on the card list