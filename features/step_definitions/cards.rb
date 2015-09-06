require '../../features/support/test_world'

test_world = TestWorld.get

Given(/^the following cards exist:$/) do |cards|
  # table is a table.hashes.keys # => [:alias, :type]

  card = Card.create_random_card(cards[:type])
  test_world.add_card(cards[:alias], card)

end