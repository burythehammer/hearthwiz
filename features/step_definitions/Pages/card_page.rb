When(/^I navigate to the card with id '(.+)'$/) do |card_id|
  step "I open the page with url '/cards/id/#{card_id}'"
end

When(/^I navigate to the '(.+)' card$/) do |card_name|
  url = URI.encode("/cards/name/#{card_name}")
  step "I open the page with url '#{url}'"
end

Then(/^I should be on the path for the card with the id '(.+)'$/) do |card_id|
  expect(current_path).to match("/cards/id/#{card_id}")
end

Then(/^the subtitle says it is the type '(.+)'$/) do |card_type|
  within(:css, 'div.page-subtitle') do
    expect(page).to have_text(card_type)
  end
end

Then(/^the card portrait displays the alt text '(.*)'$/) do |card_text|
  expect(page).to have_css('img.card-portrait', :alt == card_text)
end

Then(/^the quick info displays the flavour text '(.*)'$/) do |flavour_text|
  within(:css, 'div#card-flavour-text') do
    expect(page).to have_text(flavour_text)
  end
end

Then(/^the quick info says the card class is '(.*)'$/) do |card_class|
  within(:css, 'div#card-class') do
    expect(page).to have_text(card_class)
  end
end

Then(/^the quick info says it has '(\d+)' (.*)$/) do |amount, attribute|
  within(:css, "div#card-#{attribute}") do
    expect(page).to have_text(amount)
  end
end

Then(/^the quick info says it costs '(\d+)' mana$/) do |mana_cost|
  step "the quick info says it has '#{mana_cost}' mana"
end

Then(/^the quick info says it costs '(\d+)' mana, '(\d+)' health and '(\d+)' attack$/) do |m, h, a|
  step "the quick info says it costs '#{m}' mana"
  step "the quick info says it has '#{h}' health"
  step "the quick info says it has '#{a}' attack"
end

Then(/^the quick info says it costs '(\d+)' mana, '(\d+)' durability and '(\d+)' attack$/) do |m, d, a|
  step "the quick info says it costs '#{m}' mana"
  step "the quick info says it has '#{d}' durability"
  step "the quick info says it has '#{a}' attack"
end
