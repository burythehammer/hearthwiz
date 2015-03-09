Then(/^I should see an error stating that '(.*)'$/) do |error_text|

	expect(page).to have_css('div#error')
	expect(page).to have_content(error_text)

end
