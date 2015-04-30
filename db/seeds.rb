# Loads a different seed file depending on environment.

# Dev seeds everything
# Test just seeds Naxxramas cards
# Prod seeds main card sets

load(File.join(Rails.root, 'db', 'seeds', "#{Rails.env.downcase}.rb"))