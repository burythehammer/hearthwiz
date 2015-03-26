Feature: Homepage
	
	User should be able to view the main page of the website.
	
	@complete @debug
	Scenario: Hello world!
		When I open the homepage
		Then I should see the text 'Hello, world!' on the page