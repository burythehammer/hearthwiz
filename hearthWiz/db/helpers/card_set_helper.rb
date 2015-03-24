
def seed_card_sets(card_sets_wanted)

	# iterates over card sets, then over each card in that set
	card_sets_wanted.each do |card_set|
		CardSet.create(name: card_set)
	end

end