@ready
Feature: Footer
	
	Footer should be present on all pages so that consistant information can be displayed at the bottom.

	Scenario: Footer is present on home
		When I open home
		Then I should be on home
			And the footer should be present

	Scenario: Footer is present on card list
		When I open the card list
		Then I should be on the card list
			And the footer should be present

	Scenario: Footer is present on card
		Given the 'Deathlord' card exists
		When I navigate to the 'Deathlord' card
		Then I should see the title 'Deathlord'
			And the footer should be present