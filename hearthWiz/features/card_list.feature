Feature: Card List Page
	
	User should be able to view a list of cards, filtered and organised.

	@complete
	Scenario: Header of card list page
		When I open the card list index page
		Then I should see a header "h1" with text "All Cards"


	@todo 
	Scenario: Card page can be navigated to from the card list page
		When I open the card list index page
			And I click the link to the card "Test"
		Then I should see a header "h1" with text "Test"

	@todo 
	Scenario: Links are displayed for all cards
		When I open the card list index page
		Then I should see a link to the card "Test"