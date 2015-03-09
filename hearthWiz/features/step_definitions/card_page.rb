When(/^I directly open the card page of the card that has id '(.*?)'$/) do |id|
	 step "I open the page with url '/cards/#{id}/'"
end

Then(/^I should be on the card page for '(.*)'$/) do |card_name|
	expect(page).to have_css('div#card_title')
	expect(page).to have_content(card_name)
end

Then(/^I should be on the card page with the id '(\d+)'$/) do |id|
	expect(current_path).to match("/cards/#{id}")
end


When(/^I open the incorrect card page of the card that has id '(\d+)'$/) do |id|
	 step "I open the page with url '/cards/#{id}/'"
end