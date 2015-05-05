When(/^I open the homepage$/) do
  step "I open the page with url '#{root_path}'"
end

Then(/^I should be on the homepage$/) do
  step "I should be on the path '#{root_path}'"
end
