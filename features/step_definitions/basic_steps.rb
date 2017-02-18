Given(/^I am on the "([^"]*)" page$/) do |page|
  case page
    when 'registration'
      visit registrations_path
  end
end

Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end