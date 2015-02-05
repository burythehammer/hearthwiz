Feature: Card Page
	
	User should be able to view an individual card and its details.


	
	@todo
	Scenario Outline: Card page is present in direct links
		When I visit the page /cards/<id>
		Then I should see a header "h1" with text "<card_name>"

		Examples: Cards
			| id | card_name |
			| 1	 | test		 |


	@todo
	Scenario: When browsing to an unknown card page

		When I open the card page of a card that doesn't exist
		Then I should be sent to the page with title "Card List"
			And I should see a header "h1" with text "All Cards"
