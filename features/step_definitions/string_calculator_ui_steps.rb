# frozen_string_literal: true

Given('I am on the home page') do
  visit '/'
end

When('I enter {string} in the calculator') do |input|
  # Find the textarea and fill it with the input
  find('#numbers').fill_in with: input
end

When('I click {string}') do |button_text|
  click_button button_text
end

Then('I should see {string}') do |expected_text|
  # Wait for the result or error to appear
  expect(page).to have_content(expected_text)
end
