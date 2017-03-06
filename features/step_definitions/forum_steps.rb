And(/^the forum board "([^"]*)" exists$/) do |board|
  Thredded::Messageboard.create(name: board)
end

Then(/^there should be "([^"]*)" topic on the board "([^"]*)"$/) do |number, name|
  board = Thredded::Messageboard.find_by(name: name)
  expect(board.topics.count).to eq number.to_i
end