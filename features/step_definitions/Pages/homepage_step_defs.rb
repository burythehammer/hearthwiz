homePageObject = HomePageObject.new

card_list_page_object = CardListPageObject.new
test_world = TestWorld.instance

When(/^I open home$/) do
  homePageObject.load
end

Then(/^I should be on home$/) do
  expect(current_path).to eq(homePageObject.url)
end
