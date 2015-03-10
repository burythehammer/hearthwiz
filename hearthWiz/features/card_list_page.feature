Feature: Card List Page
	
	User should be able to view a list of cards, filtered and organised.

	@complete
	Scenario: Header of card list page
		When I open the card list index page
		Then I should see a header 'h1' with text 'All Cards'

	@complete
	Scenario: Card page can be navigated to from the card list page
		Given the card with name 'Abomination' exists
		When I open the card list index page
			And I click the link to the card 'Abomination'
		Then I should be on the card page for the card named 'Abomination'

	@complete
	Scenario: Links are displayed for cards and can be clicked
		Given the card with name 'Faceless Manipulator' exists
		When I open the card list index page
		Then I should see a link to the card 'Faceless Manipulator'
		When I click the link to the card 'Faceless Manipulator'
		Then I should be on the card page for the card named 'Faceless Manipulator'