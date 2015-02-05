Feature: Card Page
	
	User should be able to view an individual card and its details.
	
	@todo
	Scenario Outline: Heading of card page is present
		When I open the card page of the card that has index <index>
		Then I should see a header "h1" with text "<card>"

	Examples:

	| card 			 | index 	|
	| Leeroy Jenkins | 5		|
	| test			 | 0		|