AfterConfiguration do
  begin
    require File.join(Rails.root, 'db', 'seeds.rb')
   rescue
     Rails.logger 'Cucumber hook issue: Could not load seeds file'
  end
end

After do |scenario|
  begin
    save_page if scenario.failed?
  rescue
    Rails.logger 'Cucumber hook issue: Could not save page after cucumber failure'
  end
end
