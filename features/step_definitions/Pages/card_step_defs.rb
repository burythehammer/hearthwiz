card_page = CardPageObject.new
test_world = TestWorld.instance

Given(/^the following cards exist:$/) do |cards|

  cards.hashes.each do |row|
    test_world.new_card(row[:alias], row[:type])
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
  card_page.ensure_subtitle_has_text(card_type)
end

Then(/^the card portrait displays the alt text '(.*)'$/) do |card_text|
  expect(page).to have_css('img.card-portrait', :alt == card_text)
end

Then(/^the quick info displays the flavour text '(.*)'$/) do |flavour_text|
  card_page.ensure_flavour_text_is(flavour_text)
end

Then(/^the quick info says the card class is '(.*)'$/) do |card_class|
  card_page.ensure_quick_info_class_is(card_class)
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


