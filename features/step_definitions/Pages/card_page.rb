When(/^I open the card page for the card with id '(.+)'$/) do |card_id|
  step "I open the page with url '/cards/id/#{card_id}'"
end

When(/^I open the '(.+)' card page$/) do |card_name|
  url = URI.encode("/cards/name/#{card_name}")
  step "I open the page with url '#{url}'"
end

Then(/^I should be on the '(.+)' card page$/) do |card_name|
  expect(page).to have_css('div.page-title', :text == card_name)
end

Then(/^I should be on the path for the card with the id '(.+)'$/) do |card_id|
  expect(current_path).to match("/cards/id/#{card_id}")
end

Then(/^the page subtitle says it is the type '(.+)'$/) do |card_type|
  expect(page).to have_css('div.page-subtitle', :text == card_type)
end

Then(/^the page subtitle says it is the rarity '(.+)'$/) do |rarity|
  expect(page).to have_css('div.page-subtitle', :text == rarity)
end

Then(/^the card portrait displays the alt text '(.*)'$/) do |card_text|
  expect(page).to have_css('img.card-portrait', :alt == card_text)
end

Then(/^the quick info displays the flavour text '(.*)'$/) do |flavour_text|
  expect(page).to have_css('div#card-flavour-text', :text == flavour_text)
end

Then(/^the quick info says the card class is '(.*)'$/) do |card_class|
  expect(page).to have_css('div#card-class', :text == card_class)
end

Then(/^the quick info says it costs '(\d+)' mana$/) do |mana|
  expect(page).to have_css('div#card-mana-cost', :text == mana)
end

Then(/^the quick info says it has '(\d+)' health$/) do |health|
  expect(page).to have_css('div#card-health', :text == health)
end

Then(/^the quick info says it has '(\d+)' durability$/) do |durability|
  expect(page).to have_css('div#card-durability', :text == durability)
end

Then(/^the quick info says it has '(\d+)' attack$/) do |attack|
  expect(page).to have_css('div#card-attack', :text == attack)
end
