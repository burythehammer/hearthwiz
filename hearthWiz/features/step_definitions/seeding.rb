Given(/^The database is seeded$/) do
	@card = Card.new(name: "test", cost: 3, rarity: "Rare")
	@card.save
	expect(@card.id).to be_eq(1)
end

Given(/^The database is cleaned$/) do
	Card.find(1).destroy
end