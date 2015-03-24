print 'Loading tests seeds'

#loads entire helpers directory
Dir[File.join(Rails.root, 'db', 'helpers', '*.rb')].each {|file| require file }

clean_database
seed_rarities
seed_classes
seed_test_cards