Then(/^I should see a map with "([^"]*)" markers$/) do |count|
  sleep(1)
  expect(page.assert_selector('.leaflet-marker-icon', count: count.to_i)).to eq true
end

Then(/^I expect a map to load$/) do
  sleep(1)
  expect(page).to have_css '.leaflet-container'
end

When(/^I click the first marker$/) do
  find_all('.leaflet-marker-icon').first.click
end