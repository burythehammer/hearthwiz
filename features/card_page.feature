Feature: Card Page
	
	User should be able to view an individual card and its details.

	@complete
	Scenario: Card page is present in direct id links

	Given the card with id 'FP1_009' exists
		And the card with id 'FP1_009' has the name 'Deathlord'
	When I open the card page for the card with id 'FP1_009'
	Then I should be on the 'Deathlord' card page

	@complete
	Scenario: Card page shows spell information

	Given the card with name 'Reincarnate' exists
		And the 'Reincarnate' card has the card type 'Spell'
	When I open the 'Reincarnate' card page
	Then I should be on the 'Reincarnate' card page
		And the page subtitle says it is the rarity 'Common'
		And the page subtitle says it is the type 'Spell'
		And the card portrait displays the alt text 'Destroy a minion, then return it to life with full Health.'
		And the quick info displays the flavour text 'It's like birth, except you're an adult and you were just dead a second ago.'
		And the quick info says it costs '2' mana

	@complete
	Scenario: Card page shows minion information

	Given the card with name 'Deathlord' exists
		And the 'Deathlord' card has the card type 'Minion'
	When I open the 'Deathlord' card page
	Then I should be on the 'Deathlord' card page
		And the page subtitle says it is the rarity 'Rare'
		And the page subtitle says it is the type 'Minion'
		And the card portrait displays the alt text 'Taunt. Deathrattle: Your opponent puts a minion from their deck into the battlefield.'
		And the quick info displays the flavour text '"Rise from your grave!" - Kel'Thuzad'
		And the quick info says it costs '3' mana
		And the quick info says it has '8' health
		And the quick info says it has '3' attack

	@complete	
	Scenario: Card page shows weapon information

	Given the card with name 'Death's Bite' exists
		And the 'Death's Bite' card has the card type 'Weapon'
	When I open the 'Death's Bite' card page
	Then I should be on the 'Death's Bite' card page
		And the page subtitle says it is the rarity 'Common'
		And the page subtitle says it is the type 'Weapon'
		And the card portrait displays the alt text 'Deathrattle: Deal 1 damage to all minions.'
		And the quick info displays the flavour text '"Take a bite outta Death." - McScruff the Deathlord'
		And the quick info says it costs '4' mana
		And the quick info says it has '2' durability
		And the quick info says it has '4' attack


	@complete
	Scenario: When browsing to a card page with unknown id

	Given the card with id 'SDKSLDPAO' does not exist
	When I open the card page for the card with id 'SDKSLDPAO'
	Then I should see the card list page
		And I should see an error stating that 'That card could not be found!'