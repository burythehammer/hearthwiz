Then(/^the footer should be present$/) do
  expect(page).to have_selector('div.footer', :visible)
end
