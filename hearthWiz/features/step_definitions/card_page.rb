When(/^I open the card page of the card that has id '(.*?)'$/) do |id|
	 step "I open the page with url '/cards/#{id}/'"
end

Then(/^I should be on the card page$/) do
	expect(current_path).to match("/cards/.*")
end

Then(/^I should be on the card page with the id '(\d+)'$/) do |id|
	expect(current_path).to match("/cards/#{id}")
end
