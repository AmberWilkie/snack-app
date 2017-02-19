Feature: I can login and out (and use the nav bar)

  Background:
    Given the following users exist:
      | email           | name |
      | anna@random.com | Anna |
    And I am on the "home" page

  Scenario: I log in and out
    When I click "Login"
    And I fill in:
      | element  | content         |
      | Email    | anna@random.com |
      | Password | password        |
    And I click "Login"
    Then I should be on the profile page for "Anna"
    When I click "Logout"
    Then I should see "Hello and welcome to Snack"
    And I should not see "My Profile"