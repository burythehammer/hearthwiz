AfterConfiguration do |config|
	require File.join(Rails.root, 'db', 'seed_test.rb')
end


After do |scenario|
  if scenario.failed?
    save_page
  end
end