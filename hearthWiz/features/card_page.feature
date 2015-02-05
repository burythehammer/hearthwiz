Feature: Card Page
	
	User should be able to view an individual card and its details.


	

	@failing
	Scenario: Card page is present in direct links
		When I open the card page of the card that has id '1'
		Then I should see a header 'h1' with text 'test'


	@failing
	Scenario: When browsing to an unknown card page

		When I open the card page of a card that doesn't exist
		Then I should see the card list page
			And I should see a header 'h1' with text 'All Cards'
