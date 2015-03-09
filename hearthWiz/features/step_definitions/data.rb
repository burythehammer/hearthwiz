Given(/^the card with id '(\d+)' does not exist$/) do |id|
	
	expect {
		card = Card.find(id)
	}.to raise_error(ActiveRecord::RecordNotFound)

end


Given(/^the card with id '(\d+)' exists$/) do |id|

	expect {
		card = Card.find(id)
	}.to_not raise_error

end


Given(/^the card with name '(.*)' exists$/) do |name|

	card = Card.find_by!(name: name)
	expect(card[:name]).to eq(name) 

end


Given(/^the card with id '(\d+)' has the name '(.*)'$/) do |id, card_name|

	card = Card.find(id)
	expect(card[:name]).to eq(card_name) 

end

