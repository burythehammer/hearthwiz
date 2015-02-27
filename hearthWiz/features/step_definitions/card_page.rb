When(/^I open the card page of the card that has id '(.*?)'$/) do |id|
	 step "I open the page with url '/cards/#{id}/'"
end

When(/^I open the card page of a card that doesn't exist$/) do
  	step "I open the card page of the card that has id '10000'"
end

Then(/^I should be on the card page$/) do
	expect(current_path).to match("/cards/.*")
end