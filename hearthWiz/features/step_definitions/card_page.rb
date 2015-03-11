When(/^I directly open the card page for the card with id '(.+)'$/) do |card_id|
	 step "I open the page with url '/cards/id/#{card_id}/'"
end

When(/^I directly open the card page for the card named '(.+)'$/) do |card_name|
	card = Card.find_by!(name: card_name)
	expect(card[:name]).to eq(card_name)
	step "I directly open the card page for the card with id '#{card[:id]}'"
end

Then(/^I should be on the card page for the card named '(.+)'$/) do |card_name|
	expect(page).to have_css('div#card_title', :text == card_name)
end

Then(/^I should be on the correct path for the card with the id '(.+)'$/) do |card_id|
	expect(current_path).to match("/cards/#{card_id}")
end

Then(/^the card page should tell me that the card has the type '(.+)'$/) do |card_type|
	expect(page).to have_css('td#card_type', :text == card_type)
end
