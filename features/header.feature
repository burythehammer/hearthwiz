	@ready
	Feature: Page header

	Header should be present on all pages to allow navigation between key points on the website


	Scenario: Use header to navigate from card list to homepage
		When I open the card list
		 And I click on the text 'HearthWiz' in the header
		Then I should be on home
			And I should see the text 'HearthWiz'

	Scenario: Use header to navigate from homepage to card list
		When I open home
		Then the header should be present
		When I click on the text 'Cards' in the header
		Then I should be on the card list
			And I should see the title 'All Cards'