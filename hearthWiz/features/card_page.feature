Feature: Card Page
	
	User should be able to view an individual card and its details.

	@complete
	Scenario: Card page is present in direct links
	Given the card with id '1' exists
		And the card with id '1' has the name 'Abusive Sergeant'
		When I directly open the card page of the card that has id '1'
		Then I should see a header 'h1' with text 'Abusive Sergeant'


	@complete
	Scenario: When browsing to an unknown card page

	Given the card with id '10000' does not exist
	When I directly open the card page of the card that has id '10000'
	Then I should see the card list page
		And I should see an error stating that 'That card could not be found!'