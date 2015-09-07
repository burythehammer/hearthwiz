Given(/^the following cards exist:$/) do |cards|
  cards.each do |c|
    test_world.new_card(c[:alias], c[:type])
  end
end

When(/^I navigate to the card page for '(.+)'$/) do |card_alias|
  card = test_world.get_card(card_alias)
  card_page.go_to(card.id)
end

Then(/^I should be on the card page for '(.+)'$/) do |card_alias|
  card = test_world.get_card(card_alias)
  card_page.ensure_is_current(card.id)
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
  card_page.ensure_quick_info_attribute(amount, attribute)
end

Then(/^the quick info says it costs '(\d+)' mana$/) do |mana_cost|
  card_page.ensure_quick_info_attribute(mana_cost, 'mana')
end

Then(/^the quick info says it costs '(\d+)' mana, '(\d+)' health and '(\d+)' attack$/) do |m, h, a|
  card_page.ensure_quick_info_attribute(m, 'mana')
  card_page.ensure_quick_info_attribute(h, 'health')
  card_page.ensure_quick_info_attribute(a, 'attack')
end

Then(/^the quick info says it costs '(\d+)' mana, '(\d+)' durability and '(\d+)' attack$/) do |m, d, a|
  card_page.ensure_quick_info_attribute(m, 'mana')
  card_page.ensure_quick_info_attribute(d, 'durability')
  card_page.ensure_quick_info_attribute(a, 'attack')
end


