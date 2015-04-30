Feature: Card List Page
	
	User should be able to view a list of cards, filtered and organised.

	@complete
	Scenario: Title of card list page
		When I open the card list page
		Then I should see the title 'All Cards' on the page


	@complete
	Scenario: Card page can be navigated to from the card list page
		Given the card with name 'Deathlord' exists
		When I open the card list page
		Then I should see a link to the card 'Deathlord'
		When I click the link to the card 'Deathlord'
		Then I should be on the 'Deathlord' card page

	@complete
	Scenario: Card information is shown underneath a card
		Given the card with name 'Deathlord' exists
			And the 'Deathlord' card has type 'Minion'
			And the 'Deathlord' card has rarity 'Rare'
			And the 'Deathlord' card has class 'Neutral'
		When I open the card list page
		Then I should see a card element for 'Deathlord'
		And the card element should tell me that 'Deathlord' has type 'Minion'
		And the card element should tell me that 'Deathlord' has rarity 'Rare'
		And the card element should tell me that 'Deathlord' has class 'Neutral'