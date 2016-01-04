card_list_page_object = CardListPageObject.new
test_world = TestWorld.instance

When(/^I open the card list$/) do
  card_list_page_object.go_to
end

When(/^I open the card '(.*?)' from the card list$/) do |card_alias|
  card = test_world.get_card(card_alias)
  card_list_page_object.click(card)
end

Then(/^I should be on the card list$/) do
  card_list_page_object.ensure_is_current
end

Then(/^I should see a card element for '(.*?)'$/) do |card_alias|
  card = test_world.get_card(card_alias)
  expect(card_list_page_object.is_card_listed(card.name)).to eq(true)
end


Then(/^the details for "([^"]*)" should be shown on the card list$/) do |card_alias|
  card = test_world.get_card(card_alias)

  expect(card_list_page_object.get_card_type(card.id)).to eq(card.type)
  expect(card_list_page_object.get_card_quality(card.id)).to eq(card.rarity)
  expect(card_list_page_object.get_card_player_class(card.id)).to eq(card.player_class)
end