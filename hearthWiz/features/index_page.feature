Feature: Index Page
	
	User should be able to view the main page of the website.
	
	@complete
	Scenario: hello world!
		When I open the index page
		Then I should see the text "Hello, world!" on the page