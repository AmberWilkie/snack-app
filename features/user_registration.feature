Feature: Users can create an account

  Scenario: I create my account and view my profile page
    Given I am on the "registration" page
    When I fill in:
      | element               | content                 |
      | Email                 | email@random.com        |
      | Password              | password                |
      | Password Confirmation | password                |
      | Name                  | Anna K.                 |
      | Zip Code              | 41463                   |
      | blurb                 | I want to speak German! |
      | Username (for forums) | RandomGuy               |
    And I select "Prefer Not to Say" from "user_gender"
    And I select "French" and "Spanish" from "user_language_list"
    And I select "Swedish" from "user_learning_list"
    And I click "Sign up"
    Then I should see:
      | text                    |
      | Welcome to Snack!       |
      | Anna K.                 |
      | I want to speak German! |
      | Spanish                 |
      | Swedish                 |