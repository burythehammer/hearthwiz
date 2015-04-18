print 'Loading development seeds'

#loads entire helpers directory
Dir[File.join(Rails.root, 'db', 'helpers', '*.rb')].each {|file| require file }

wanted_card_sets = 
		["Basic",
		"Blackrock Mountain",
		"Classic",
		"Credits",
		"Curse of Naxxramas",
		"Debug",
		"Goblins vs Gnomes",
		"Missions",
		"Promotion",
		"Reward",
		"System"]

clean_database
seed_rarities
seed_classes
seed_card_sets(wanted_card_sets)
seed_cards(wanted_card_sets)
