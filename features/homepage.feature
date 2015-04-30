Feature: Homepage
	
	User should be able to view the main page of the website.
	
	@complete
	Scenario: Homepage title
		When I open the homepage
		Then I should be on the homepage
			And I should see the text 'HearthWiz' on the page