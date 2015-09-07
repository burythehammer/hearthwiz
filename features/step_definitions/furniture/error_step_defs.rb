Then(/^I should see an error stating that '(.*)'$/) do |error_text|
  within(:css, 'div#error') do
    expect(page).to have_text(error_text)
  end
end
