Then(/^I should see the text "(.*)" on the page$/) do |expectedText|
	expect(page).to have_content(expectedText)
end

Then(/^I should see the page with title "(.*)"$/) do |expectedTitle|
	expect(page).to have_title(expectedTitle) 
end

#TODO
#this regex for header is terrible - replace it!

Then(/^I should see a header "(.*)" with text "(.*)"$/) do |headingType, expectedHeaderText|
	expect(page).to have_selector headingType, text: expectedHeaderText
end
