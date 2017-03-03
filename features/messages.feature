Feature: As a user
  in order to get in touch with other users
  I would like to send and receive messages

  Background:
    Given the following users exist:
      | email           | name |
      | anna@random.com | Anna |
      | ben@random.com  | Ben  |
      | jon@random.com  | Jon  |
    And "Anna" and "Jon" are friends
    And I am logged in as "anna@random.com"

    Scenario: I send a message
      Given I am on the profile page for "jon@random.com"
      And I click "Message"
      When I fill in "message_body" with "A message for Jon"
      And I click "Send"
      Then I should see "A message for Jon"
      When I log out
      And I am logged in as "jon@random.com"
      And I am on the "inbox" page
      Then I should see "Anna"
      And I should see "New!"