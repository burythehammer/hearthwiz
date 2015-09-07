card_list_page_object = CardListPageObject.new
test_world = TestWorld.get

When(/^I open the card list$/) do
  card_list_page_object.go_to
end

Then(/^I should be on the card list$/) do
  card_list_page_object.ensure_is_current
end

Then(/^I should see a card element for '(.*?)'$/) do |card_alias|
  card = test_world.get_card(card_alias)
  card_list_page_object.is_card_listed(card.name)
end

When(/^I open the card '(.*?)' from the card list$/) do |card_alias|
  card = test_world.get_card(card_alias)
  card_list_page_object.click(card)
end


Then(/^the card list says '(.*?)' has the correct information$/) do |card_alias|
  card = test_world.get_card(card_alias)
  within(:css, "div.card-box-info##{info}-info") { expect(page).to have_text(value) }
end


And(/^the details for "([^"]*)" should be shown on the card list$/) do |card_alias|
  card = test_world.get_card(card_alias)

  expect(card_list_page_object.get_card_type(card_id)).to eq(card.type)
  expect(card_list_page_object.get_card_rarity(card_id)).to eq(card.rarity)
  expect(card_list_page_object.get_card_player_class(card_id)).to eq(card.player_class)
end