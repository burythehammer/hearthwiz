cardListPageObject = CardListPageObject.new

When(/^I open the card list$/) do
  cardListPageObject.load
end

Then(/^I should be on the card list$/) do
  expect(current_path).to eq(cardListPageObject.url)
  within(:css, 'div#all_cards_title') { expect(page).to have_text('All Cards') }
end

Then(/^I should see a card element for '(.*?)'$/) do |name|
  within(:css, "li.card-block##{name}-block") { expect(page).to have_text(name) }
end

When(/^I open the card '(.*?)' from the card list$/) do |name|
  step "I should see the link '#{name}'"
  click_link(name)
end

Then(/^I should see a link to the card '(.*?)'$/) do |name|
  step "I should see the link '#{name}'"
end

Then(/^the card element says '(.*?)' has type '(.*?)'$/) do |name, type|
  step "the card block info for '#{name}' has value '#{type}'"
end

Then(/^the card element says '(.*?)' has rarity '(.*?)'$/) do |name, rarity|
  step "the card block info for '#{name}' has value '#{rarity}'"
end

Then(/^the card element says '(.*?)' has player class '(.*?)'$/) do |name, pclass|
  step "the card block info for '#{name}' has value '#{pclass}'"
end

Then(/^the card block info for '(.*?)' has value '(.*?)'$/) do |info, value|
  within(:css, "div.card-block-info##{info}-info") { expect(page).to have_text(value) }
end
