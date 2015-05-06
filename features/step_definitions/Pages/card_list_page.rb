When(/^I open the card list page$/) do
  step "I open the page with url '/cards'"
end

Then(/^I should be on the card list page$/) do
  step "I should be on the path '#{cards_path}'"
  within(:css, 'div#all_cards_title') do
    expect(page).to have_content('All Cards')
  end
end

Then(/^I should see a card element for '(.*?)'$/) do |name|
  within(:css, "li.card-block##{name}-block") do
    expect(page).to have_content(name)
  end
end

When(/^I click the link to the card '(.*?)'$/) do |name|
  step "I should see the link '#{name}'"
  click_link(name)
end

Then(/^I should see a link to the card '(.*?)'$/) do |name|
  step "I should see the link '#{name}'"
end

Then(/^the card element says '(.*?)' has type '(.*?)'$/) do |name, type|
  within(:css, "div.card-block-info##{name}-info") do
    expect(page).to have_content(type)
  end
end

Then(/^the card element says '(.*?)' has rarity '(.*?)'$/) do |name, rarity|
  within(:css, "div.card-block-info##{name}-info") do
    expect(page).to have_content(rarity)
  end
end

Then(/^the card element says '(.*?)' has class '(.*?)'$/) do |name, pclass|
  within(:css, "div.card-block-info##{name}-info") do
    expect(page).to have_content(pclass)
  end
end
