Given(/^"([^"]*)" and "([^"]*)" are friends$/) do |name1, name2|
  user1 = User.find_by(name: name1)
  user2 = User.find_by(name: name2)
  user1.friend_request(user2)
  user2.accept_request(user1)
end