When(/^I open the card page of the card that has id (\d+)$/) do |id|
	visit "/cards/#{id}"
end

When(/^I open the card page of a card that doesn't exist$/) do
  	step "I open the card page of the card that has index 10000"
end
