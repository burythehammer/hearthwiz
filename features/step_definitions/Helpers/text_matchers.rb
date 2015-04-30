Then(/^I should see the text '(.*)' on the page$/) do |expectedText|
	expect(page).to have_content(expectedText)
end

Then(/^I should see the page with title '(.*)'$/) do |expectedTitle|
	expect(page).to have_title(expectedTitle) 
end

Then(/^I should see the link '(.*?)'$/) do |link_name|
	expect(page).to have_link(link_name)
end

Then(/^I should see the title '(.*)' on the page$/) do |title_text|
  	expect(page).to have_css('div.page-title', :text == title_text)  
end