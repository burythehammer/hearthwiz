Feature: Card List Page
	
	User should be able to view a list of cards, filtered and organised.

	@complete
	Scenario: Header of card list page
		When I open the card list index page
		Then I should see a header "h1" with text "All Cards"