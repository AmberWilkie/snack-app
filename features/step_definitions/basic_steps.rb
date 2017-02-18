Given(/^I am on the "([^"]*)" page$/) do |page|
  case page
    when 'registration'
      visit new_user_registration_path
  end
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

And(/^I click "([^"]*)"$/) do |element|
  click_link_or_button element
end

And(/^I select "([^"]*)" from "([^"]*)"$/) do |content, element|
  select content, from: element
end

And(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end

And(/^I wait for the page$/) do
  sleep(1)
end

Then(/^show me the page$/) do
  save_and_open_page
end