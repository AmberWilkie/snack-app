Feature: As a Language Learner
  in order to find friends to pratice languages with
  I would like to see a list of users who match my languages / learnings.

  Background:
    Given the following users exist:
      | email           | name |
      | anna@random.com | Anna |
      | ben@random.com  | Ben  |
      | jon@random.com  | Jon  |
    And "Anna" speaks "Spanish" and wants to learn "Japanese"
    And "Ben" speaks "Japanese" and wants to learn "Spanish"
    And "Jon" speaks "Japanese" and wants to learn "Italian"
    And I am logged in as "anna@random.com"

  Scenario: I see a list of users who match me with languages
    Given I am on the "matches" page
    Then I should see "Ben"
    And I should not see "Jon"
    When I click "Ben"
    Then I should see "Japanese"