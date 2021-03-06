Given(/^I am on the profile page for "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  visit user_path(user)
end

Then(/^I should be on the profile page for "([^"]*)"$/) do |name|
  user = User.find_by(name: name)
  expect(current_path).to eq user_path(user)
end