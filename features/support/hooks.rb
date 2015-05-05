AfterConfiguration do # |config|
  require File.join(Rails.root, 'db', 'seeds.rb')
end

After do |scenario|
  if scenario.failed?
    save_page
  end
end
