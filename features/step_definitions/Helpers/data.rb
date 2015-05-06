Given(/^the card with id '(.+)' does not exist$/) do |id|
  expect { Card.find(id) }.to raise_error(ActiveRecord::RecordNotFound)
end

Given(/^the card with id '(.+)' exists$/) do |id|
  expect { Card.find(id) }.to_not raise_error
end

Given(/^the card with name '(.+)' exists$/) do |name|
  card = Card.find_by!(name: name)
  expect(card.name).to eq(name)
end

Given(/^the card with id '(.+)' is named '(.+)'$/) do |id, name|
  expect(Card.find(id).name).to eq(name)
end

Given(/^the '(.+)' card has type '(.+)'$/) do |name, type|
  expect(Card.find_by(name: name).card_type).to eq(type)
end

Given(/^the '(.+)' card has rarity '(.+)'$/) do |name, rarity|
  expect(Card.find_by(name: name).rarity_name).to eq(rarity)
end

Given(/^the '(.+)' card has class '(.+)'$/) do |name, pclass|
  expect(Card.find_by(name: name).player_class_name).to eq(pclass)
end
