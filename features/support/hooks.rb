AfterConfiguration do # |config|
  require File.join(Rails.root, 'db', 'seeds.rb')
end

After do |scenario|
  save_page if scenario.failed?
end
