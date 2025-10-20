Given('I am on the home page') do
  visit root_path
end

When('I enter the numbers string:') do |string|
  # The React textarea has id="numbers"
  find('textarea#numbers', wait: 2).set(string)
end

When('I press Calculate') do
  click_button 'Calculate'
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end


