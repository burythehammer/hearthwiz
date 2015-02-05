When(/^I open the card page of the card that has index (\d+)$/) do |cardIndex| 
	visit "/card/#{cardIndex}"
end