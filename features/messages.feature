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
      Given I am on the "messages" page
      And I click "Send a Message"
      When I select "Jon" from "Recipient"
      And I fill in "Body" with "A message for Jon"
      And I click "Send"
      When I am logged in as "jon@random.com"
      And I am on the "messages" page
      Then I should see "A message for Jon"