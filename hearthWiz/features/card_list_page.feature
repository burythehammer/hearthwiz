Feature: Card List Page
	
	User should be able to view a list of cards, filtered and organised.

	@complete
	Scenario: Header of card list page
		When I open the card list index page
		Then I should see the text 'All Cards' on the page


	@complete
	Scenario: Card page can be navigated to from the card list page
		Given the card with name 'Deathlord' exists
		When I open the card list index page
		Then I should see a link to the card 'Deathlord'
		When I click the link to the card 'Deathlord'
		Then I should be on the 'Deathlord' card page


	Scenario: Card list shows general details about a single card
		Given the card with name 'Deathlord' exists
		When I open the card list index page
		Then I should see the 'Deathlord' card listed
			And I should see a link to the card 'Deathlord'
			And the card list page tells me 'Deathlord' costs '3' mana
			And the card list page tells me 'Deathlord' has '8' health
			And the card list page tells me 'Deathlord' has '3' attack