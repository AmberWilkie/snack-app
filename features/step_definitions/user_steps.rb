When(/^I fill in:$/) do |table|
  table.hashes.each do |hash|
    fill_in hash[:element], with: hash[:content]
  end
end

Given(/^the following users exist:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, email: hash[:email], name: hash[:name], location: hash[:location])
  end
end

And(/^I am logged in as "([^"]*)"$/) do |email|
  user = User.find_by(email: email)
  login_as(user)
end

Then(/^I should not see the "([^"]*)" button$/) do |button|
  expect(page).to have_no_button button
end

When(/^I log out$/) do
  logout
end

And(/^"([^"]*)" has friend\-requested "([^"]*)"$/) do |my_email, friend_email|
  friend = User.find_by(email: friend_email)
  me = User.find_by(email: my_email)
  me.friend_request(friend)
end

Then(/^"([^"]*)" should be in the "([^"]*)" list for "([^"]*)"$/) do |friend_name, list, my_name|
  friend = User.find_by(name: friend_name)
  me = User.find_by(name: my_name)
  case list
    when "pending friends"
      expect(me.pending_friends.last).to eq friend
    when "requested friends"
      expect(me.requested_friends.last).to eq friend
    when "friends"
      expect(me.friends.last).to eq friend
    else
      expect(2+2).to eq 5
  end
end

When(/^I click "([^"]*)" for "([^"]*)"$/) do |link, name|
  friend = User.find_by(name: name)
  within(:css, "#friend_#{friend.id}") do
    click_link_or_button link
  end
end