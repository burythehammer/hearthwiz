Feature: Card Page
	
	User should be able to view an individual card and its details.

	@complete
	Scenario: Card page is present in direct id links

	Given the card with id '787' exists
		And the card with id '787' has the name 'Crackle'
	When I directly open the card page for the card with id '787'
	Then I should be on the card page for the card named 'Crackle'

	@complete
	Scenario: Card page shows spell information

	Given the card with name 'Crackle' exists
		And the card with name 'Crackle' has the card type 'Spell'
	When I directly open the card page for the card named 'Crackle'
	Then I should be on the card page for the card named 'Crackle'
		And the card page should tell me that the card has the type 'Spell'

	@complete
	Scenario: When browsing to an unknown card page

	Given the card with id '12345678' does not exist
	When I directly open the card page for the card with id '12345678'
	Then I should see the card list page
		And I should see an error stating that 'That card could not be found!'