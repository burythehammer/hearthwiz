Feature: Card Page
	
	User should be able to view an individual card and its details.


	
	@todo
	Scenario Outline: Card page is present in direct links
		When I open the card page of the card that has id <id>
		Then I should see a header "h1" with text "<card_name>"

		Examples: Cards
			| id | card_name |
			| 1	 | test		 |


	@todo
	Scenario: When browsing to an unknown card page

		When I open the card page of a card that doesn't exist
		Then I should see the card list page
			And I should see a header "h1" with text "All Cards"
