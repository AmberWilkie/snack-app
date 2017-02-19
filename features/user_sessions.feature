Feature: I can login and out (and use the nav bar)

  Background:
    Given the following users exist:
      | email           | name | location |
      | anna@random.com | Anna | 41000    |
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

  Scenario: I edit my profile
    Given I am logged in as "anna@random.com"
    And I am on the "home" page
    When I click "Edit Profile"
    And I fill in:
      | element                | content         |
      | Email                  | anna@random.com |
      | user[current_password] | password        |
      | Name                   | A New Anna      |
    And I click "Update"
    Then I should be on the profile page for "Anna"
    Then I should see "A New Anna"

