Given(/^I am on the "([^"]*)" page$/) do |page|
  case page
    when 'registration'
      visit new_user_registration_path
    when 'home' || 'index'
      visit root_path
    when 'matches'
      visit matches_path
    when 'inbox'
      visit conversations_path
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

And(/^I select "([^"]*)" and "([^"]*)" from "([^"]*)"$/) do |content1, content2, element|
  select content1, from: element
  select content2, from: element
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:text]
  end
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, content|
  fill_in element, with: content
end

Then(/^show me an image of the page$/) do
  page.save_screenshot '/screenshot.png'
  Launchy.open '/screenshot.png'
end