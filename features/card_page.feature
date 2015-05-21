@ready
Feature: Card details
	
	User should be able to view an individual card and its details.

	Scenario: Card can be navigated to from direct id links

	Given the card with id 'FP1_009' exists
		And the card with id 'FP1_009' is named 'Deathlord'
	When I navigate to the card with id 'FP1_009'
	Then I should see the title 'Deathlord'

	Scenario: When browsing to a card with unknown id

	Given the card with id 'SDKSLDPAO' does not exist
	When I navigate to the card with id 'SDKSLDPAO'
	Then I should be on the card list
		And I should see an error stating that 'That card ID could not be found!'

	Scenario Outline: Card title

	Given the '<card-name>' card exists
		And the '<card-name>' card has type '<type>'
	When I navigate to the '<card-name>' card
	Then I should see the title '<card-name>'
		And the subtitle contains the text '<rarity>'
		And the subtitle contains the text '<type>'
		And the subtitle contains the text '<class>'

	Examples:
    | card-name      | type      | rarity   | class   |
    |  Deathlord     |  Minion   |  Rare    | Neutral |
    |  Death's Bite  |  Weapon   |  Common  | Warrior |
    |  Reincarnate   |  Spell    |  Common  | Shaman  |


	Scenario Outline: Card quick info text

	Given the '<card-name>' card exists
		And the '<card-name>' card has type '<type>'
	When I navigate to the '<card-name>' card
	Then the card portrait displays the alt text '<alt-text>'
		And the quick info displays the flavour text '<flavour-text>'
		And the quick info says the card class is '<class>'

	Examples:
    | card-name      | type      | class    |  alt-text   																																					| flavour-text   |
    |  Deathlord     |  Minion   |  Neutral | Taunt. Deathrattle: Your opponent puts a minion from their deck into the battlefield. | "Rise from your grave!" - Kel'Thuzad |
    |  Death's Bite  |  Weapon   |  Warrior | Deathrattle: Deal 1 damage to all minions. 																						| "Take a bite outta Death." - McScruff the Deathlord |
    |  Reincarnate   |  Spell    |  Shaman  | Destroy a minion, then return it to life with full Health. 														| It's like birth, except you're an adult and you were just dead a second ago. |

	Scenario: Card spell stats

	Given the 'Reincarnate' card exists
		And the 'Reincarnate' card has type 'Spell'
	When I navigate to the 'Reincarnate' card
	Then I should see the title 'Reincarnate'
		And the quick info says it costs '2' mana

	Scenario: Card minion stats

	Given the 'Deathlord' card exists
		And the 'Deathlord' card has type 'Minion'
	When I navigate to the 'Deathlord' card
	Then I should see the title 'Deathlord'
		And the quick info says it costs '3' mana, '8' health and '2' attack

	Scenario: Card weapon stats

	Given the 'Death's Bite' card exists
		And the 'Death's Bite' card has type 'Weapon'
	When I navigate to the 'Death's Bite' card 
	Then the quick info says it costs '4' mana, '2' durability and '4' attack
