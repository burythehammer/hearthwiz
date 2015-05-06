When(/^I open the card page for the card with id '(.+)'$/) do |card_id|
  step "I open the page with url '/cards/id/#{card_id}'"
end

When(/^I open the '(.+)' card page$/) do |card_name|
  url = URI.encode("/cards/name/#{card_name}")
  step "I open the page with url '#{url}'"
end

Then(/^I should be on the '(.+)' card page$/) do |card_name|
  within(:css, 'div.page-title') do
    expect(page).to have_content(card_name)
  end
end

Then(/^I should be on the path for the card with the id '(.+)'$/) do |card_id|
  expect(current_path).to match("/cards/id/#{card_id}")
end

Then(/^the page subtitle says it is the type '(.+)'$/) do |card_type|
  within(:css, 'div.page-subtitle') do
    expect(page).to have_content(card_type)
  end
end

Then(/^the page subtitle says it is the rarity '(.+)'$/) do |rarity|
  within(:css, 'div.page-subtitle') do
    expect(page).to have_content(rarity)
  end
end

Then(/^the card portrait displays the alt text '(.*)'$/) do |card_text|
  expect(page).to have_css('img.card-portrait', :alt == card_text)
end

Then(/^the quick info displays the flavour text '(.*)'$/) do |flavour_text|
  within(:css, 'div#card-flavour-text') do
    expect(page).to have_content(flavour_text)
  end
end

Then(/^the quick info says the card class is '(.*)'$/) do |card_class|
  within(:css, 'div#card-class') do
    expect(page).to have_content(card_class)
  end
end

Then(/^the quick info says it has '(\d+)' (.*)$/) do |amount, attribute|
  within(:css, "div#card-#{attribute}") do
    expect(page).to have_content(amount)
  end
end

Then(/^the quick info says it costs '(\d+)' mana$/) do |mana_cost|
  step "the quick info says it has '#{mana_cost}' mana"
end
