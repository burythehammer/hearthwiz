When(/^I open the card list page$/) do
  step "I open the page with url '/cards'"
end

Then(/^I should be on the card list page$/) do
  	step "I should be on the path '#{cards_path}'"
  	within(:css, 'div#all_cards_title') { 
		expect(page).to have_content("All Cards")
	}
end

Then(/^I should see a card element for '(.*?)'$/) do |card_name|
	within(:css, "li.card-block##{card_name}-block") { 
		expect(page).to have_content(card_name)
	 }
end


When(/^I click the link to the card '(.*?)'$/) do |card_name|
  	step "I should see the link '#{card_name}'"
  	click_link(card_name)
end

Then(/^I should see a link to the card '(.*?)'$/) do |card_name|
	step "I should see the link '#{card_name}'"
end


Then(/^the card element should tell me that '(.*?)' has type '(.*?)'$/) do |card_name, card_type|
	within(:css, "div.card-block-info##{card_name}-info") { 
		expect(page).to have_content(card_type)
	 }
end

Then(/^the card element should tell me that '(.*?)' has rarity '(.*?)'$/) do |card_name, card_rarity|
  	within(:css, "div.card-block-info##{card_name}-info") { 
		expect(page).to have_content(card_rarity)
	 }
end

Then(/^the card element should tell me that '(.*?)' has class '(.*?)'$/) do |card_name, card_class|
  	within(:css, "div.card-block-info##{card_name}-info") { 
		expect(page).to have_content(card_class)
	 }
end