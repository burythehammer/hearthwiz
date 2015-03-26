Given(/^the card with id '(.+)' does not exist$/) do |card_id|
	expect {
		card = Card.find(card_id)
	}.to raise_error(ActiveRecord::RecordNotFound)
end


Given(/^the card with id '(.+)' exists$/) do |card_id|
	expect {
		card = Card.find(card_id)
	}.to_not raise_error
end


Given(/^the card with name '(.+)' exists$/) do |card_name|

	expect {
		card = Card.find_by!(name: card_name)
		expect(card[:name]).to eq(card_name) 
	}.to_not raise_error

end


Given(/^the card with id '(.+)' has the name '(.+)'$/) do |card_id, card_name|
	card = Card.find(card_id)
	expect(card[:name]).to eq(card_name) 
end


Given(/^the '(.+)' card has the card type '(.+)'$/) do |card_name, card_type|
	card = Card.find_by!(name: card_name)
	expect(card[:card_type]).to eq(card_type)
end
