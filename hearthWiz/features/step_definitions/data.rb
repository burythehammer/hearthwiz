Given(/^the card with id '(\d+)' does not exist$/) do |id|
	expect(Card.find(id)).not_to exist
end

