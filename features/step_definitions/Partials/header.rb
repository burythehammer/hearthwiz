When(/^I click on the text '(.*)' in the header$/) do |header_text|

	within(:css, "div.header") do
		find('div', text: header_text, exact: true).click
	end

end

Then(/^the header should be present$/) do
	expect(page).to have_selector('div.header', :visible)
end