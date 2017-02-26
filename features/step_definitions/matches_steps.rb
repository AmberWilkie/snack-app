Given(/^"([^"]*)" speaks "([^"]*)" and wants to learn "([^"]*)"$/) do |name, language, learning|
  user = User.find_by(name: name)
  user.language_list = [language]
  user.learning_list = [learning]
  user.save
  expect(user.language_list).to eq [language]
  expect(user.learning_list).to eq [learning]
end