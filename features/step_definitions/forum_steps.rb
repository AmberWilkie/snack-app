And(/^the forum board "([^"]*)" exists$/) do |board|
  Thredded::Messageboard.create(name: board)
end