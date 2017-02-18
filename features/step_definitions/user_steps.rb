When(/^I fill in:$/) do |table|
  table.hashes.each do |hash|
    fill_in hash[:element], with: hash[:content]
  end
end