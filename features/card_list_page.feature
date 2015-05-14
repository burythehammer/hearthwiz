@ready
Feature: Card List
	
	User should be able to view a list of cards which are filtered and organised.

	Scenario: Title of card list
		When I open the card list
		Then I should see the title 'All Cards'

	Scenario: Card can be navigated to from the card list
		Given the 'Deathlord' card exists
		When I open the card list
			And I open the card 'Deathlord' from the card list
		Then I should see the title 'Deathlord'

	@debug
	Scenario: Card links are present on card list
		Given the 'Deathlord' card exists
		When I open the card list
		Then I should see a link to the card 'Deathlord'

	Scenario: Card information is shown underneath a card
		Given the 'Deathlord' card exists
			And the 'Deathlord' card has type 'Minion'
			And the 'Deathlord' card has rarity 'Rare'
			And the 'Deathlord' card has player class 'Neutral'
		When I open the card list
		Then I should see a card element for 'Deathlord'
			And the card element says 'Deathlord' has type 'Minion'
			And the card element says 'Deathlord' has rarity 'Rare'
			And the card element says 'Deathlord' has player class 'Neutral'