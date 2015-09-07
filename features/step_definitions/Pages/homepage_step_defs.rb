homePageObject = HomePageObject.new

When(/^I open home$/) do
  homePageObject.load
end

Then(/^I should be on home$/) do
  expect(current_path).to eq(homePageObject.url)
end
