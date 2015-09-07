Then(/^I should see the text '(.*)'$/) do |text|
  expect(page).to have_text(text)
end

Then(/^I should see the browser title '(.*)'$/) do |title|
  expect(page).to have_title(title)
end

Then(/^I should see the link '(.*?)'$/) do |link_name|
  expect(page).to have_link(link_name)
end

Then(/^I should see the title '(.*)'$/) do |title_text|
  within(:css, 'div.page-title') do
    expect(page).to have_text(title_text)
  end
end

Then(/^the subtitle contains the text '(.+)'$/) do |text|

end
