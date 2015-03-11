When(/^I open the card list index page$/) do
  step "I open the page with url '/cards'"
end

When(/^I click the link to the card '(.*?)'$/) do |card_name|
  	step "I should see the link '#{card_name}'"
  	click_link(card_name)
end

Then(/^I should see a link to the card '(.*?)'$/) do |card_name|
	step "I should see the link '#{card_name}'"
end

Then(/^I should see the card list page$/) do
	expect(page).to have_css('div#all_cards_title', :text == "All Cards")
end

