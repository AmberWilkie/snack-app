Feature: Having friends

  Background:
    Given the following users exist:
      | email           | name |
      | anna@random.com | Anna |
      | ben@random.com  | Ben  |
      | jon@random.com  | Jon  |
    And I am logged in as "anna@random.com"

  Scenario: I "friend" someone
    Given I am on the profile page for "ben@random.com"
    When I click "Friend"
    Then I should see "You and Ben are now friends!"
    When I am on the profile page for "anna@random.com"
    Then I should see "Ben"
    And I should not see "Jon"