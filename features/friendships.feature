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
    Then "Ben" should be in the "pending friends" list for "Anna"
    And "Anna" should be in the "requested friends" list for "Ben"

  Scenario: I can't "friend" myself
    When I am on the profile page for "anna@random.com"
    Then I should not see the "Friend" button

  Scenario: Seeing my friends after approval
    Given I am logged in as "anna@random.com"
    And "anna@random.com" has friend-requested "ben@random.com"
    When I log out
    And I am logged in as "ben@random.com"
    When I am on the profile page for "ben@random.com"
    Then I should see "Anna"
    When I click "Be friends!" for "Anna"
    Then "Anna" should be in the "friends" list for "Ben"
    When I log out
    And I am logged in as "anna@random.com"
    Then "Ben" should be in the "friends" list for "Anna"
    When I am on the profile page for "anna@random.com"
    Then I should see "Ben"