Feature: Users can create an account

  Scenario: I create my account and view my profile page
    Given I am on the "registration" page
    When I fill in:
      | element               |  content                 |
      | Email                 |  email@random.com        |
      | Password              |  password                |
      | Password Confirmation |  password                |
      | Name                  |  Anna K.                 |
      | Zip Code              |  41463                   |
      | blurb                 |  I want to speak German! |
    And I select "Prefer Not to Say" from "user_gender"
    And I click "Sign up"
    Then I should see "Welcome to Snack!"
    And I should see "Anna K."
    And I should see "I want to speak German!"