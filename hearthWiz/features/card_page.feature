Feature: Card Page
	
	User should be able to view an individual card and its details.

	@complete
	Scenario: Card page is present in direct links
		When I open the card page of the card that has id '1'
		Then I should see a header 'h1' with text 'Abusive Sergeant'


	@failing
	Scenario: When browsing to an unknown card page

	Given the card with id '10000' does not exist
	When I open the incorrect card page of the card that has id '10000'
	Then I should be redirected with an error
		And I should see the card list page
		And I should see a header 'h1' with text 'All Cards'
