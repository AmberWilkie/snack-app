Feature: As a user
  in order to communicate with non-friends
  I would like to post in the forums.

  Background:
    Given the following users exist:
      | email           | name |
      | anna@random.com | Anna |
      | ben@random.com  | Ben  |
      | jon@random.com  | Jon  |
    And I am logged in as "anna@random.com"
    And the forum board "Main Board" exists

  Scenario: I post in the forums
    Given I am on the "home" page
    When I click "Forum"
    Then I should see "Main Board"