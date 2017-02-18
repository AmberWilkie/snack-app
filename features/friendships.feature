Feature: Having friends

  Background:
    Given the following users exist:
      | email           | name |
      | anna@random.com | Anna |
      | ben@random.com  | Ben  |
      | jon@random.com  | Jon  |
    And I am logged in as "anna@random.com"

#  @javascript
  Scenario: I "friend" someone
    Given I am on the profile page for "ben@random.com"
    When I click "Friend"
#    And I wait for the page
#    Then I should see "Requested"
    # The @javascript hook isn't working. Look into this.

  Scenario: I can't "friend" myself
    When I am on the profile page for "anna@random.com"
    Then I should not see the "Friend" button