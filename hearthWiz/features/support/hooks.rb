AfterConfiguration do |config|
	load File.join(Rails.root, 'db', 'seeds.rb')
end