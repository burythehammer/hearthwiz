When(/^I open the card list page$/) do
  step "I open the page with url '/cards'"
end

Then(/^I should be on the card list page$/) do
  step "I should be on the path '#{cards_path}'"
  expect(page).to have_css('div#all_cards_title', :text == "All Cards")
end


When(/^I click the link to the card '(.*?)'$/) do |card_name|
  	step "I should see the link '#{card_name}'"
  	click_link(card_name)
end

Then(/^I should see a link to the card '(.*?)'$/) do |card_name|
	step "I should see the link '#{card_name}'"
end

Then(/^the card list page tells me '(.*)' costs '(\d+)' mana$/) do |card_name, mana_cost|
#	expect(page).to have_css('div#all_cards_title', :text == "#{mana_cost}")
pending
end

Then(/^the card list page tells me '(.*)' has '(\d+)' health$/) do |card_name, health|
#	expect(page).to have_css('div#all_cards_title', :text == "#{health}")
pending
end

Then(/^the card list page tells me '(.*)' has '(\d+)' attack$/) do |card_name, attack|
#	expect(page).to have_css('div#', :text == "#{attack}")
pending
end

Then(/^I should see the '(.*)' card listed$/) do |card_name|
	expect(page).to have_css("div##{card_name}")
end