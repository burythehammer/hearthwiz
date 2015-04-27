Feature: Card List Page
	
	A header should be present on all pages so that users can navigate through the site.

	@complete
	Scenario: Navigate to homepage from the card index page
		When I open the card list page
		Then I should be on the card list page
			And the header should be present
		When I click on the text 'HearthWiz' in the header
		Then I should be on the homepage
			And I should see the text 'HearthWiz' on the page

	@complete
	Scenario: Navigate to card index page from the homepage
		When I open the homepage
		Then the header should be present
		When I click on the text 'Cards' in the header
		Then I should be on the card list page
			And I should see the text 'All Cards' on the page