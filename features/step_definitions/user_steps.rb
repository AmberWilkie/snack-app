When(/^I fill in:$/) do |table|
  table.hashes.each do |hash|
    fill_in hash[:element], with: hash[:content]
  end
end

Given(/^the following users exist:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, email: hash[:email], name: hash[:name])
  end
end

And(/^I am logged in as "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  login_as(user)
end