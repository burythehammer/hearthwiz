When(/^I open the card page for the card with id '(.+)'$/) do |card_id|
	step "I open the page with url '/cards/id/#{card_id}'"
end

When(/^I open the '(.+)' card page$/) do |card_name|
	url = URI.encode("/cards/name/#{card_name}")
 	step "I open the page with url '#{url}'"
end

Then(/^I should be on the '(.+)' card page$/) do |card_name|
	expect(page).to have_css('div#card_title', :text == card_name)
end

Then(/^I should be on the path for the card with the id '(.+)'$/) do |card_id|
	expect(current_path).to match("/cards/id/#{card_id}")
end

Then(/^the card page tells me it is the type '(.+)'$/) do |card_type|
	expect(page).to have_css('div#card_type', :text == card_type)
end

Then(/^the card page displays the card text '(.*)'$/) do |card_text|
	expect(page).to have_css('div#card_text', :text == card_text)  
end

Then(/^the card page displays the flavour text '(.*)'$/) do |flavour_text|
	expect(page).to have_css('div#card_flavour_text', :text == flavour_text)  
end

Then(/^the card page tells me it costs '(\d+)' mana$/) do |mana|
	expect(page).to have_css('div#card_mana_cost', :text == mana)  
end

Then(/^the card page tells me it has '(\d+)' health$/) do |health|
	expect(page).to have_css('div#card_health', :text == health)  
end

Then(/^the card page tells me it has '(\d+)' durability$/) do |durability|
	expect(page).to have_css('div#card_durability', :text == durability)  
end

Then(/^the card page tells me it has '(\d+)' attack$/) do |attack|
  expect(page).to have_css('div#card_attack', :text == attack)  
end

Then(/^the card page tells me it is the rarity '(.+)'$/) do |rarity|
  expect(page).to have_css('div#card_rarity', :text == rarity)  
end
