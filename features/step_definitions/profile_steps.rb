Given(/^I am on the profile page for "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  visit home_path(user)
end