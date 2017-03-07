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
    And I click "Main Board"
    And I fill in "Title" with "Spanish by Stigbergstorget"
    And I fill in "Content" with "Let's meet!"
    And I click "Create New Topic"
    Then there should be "1" topic on the board "Main Board"
    When I click "Spanish by Stigbergstorget"
    And I fill in "post_content" with "Yes, Spanish is great."
    And I click "Submit Reply"
    Then there should be "2" posts in the topic "Spanish by Stigbergstorget"