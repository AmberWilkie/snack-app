Feature: Users can create an account

  Scenario: I create my account and view my profile page
    Given I am on the "registration" page
    When I fill in:
      | element               |  content                 |
      | Email                 |  email@random.com        |
      | Password              |  password                |
      | Password confirmation |  password                |
      | Name                  |  Anna K.                 |
      | Location              |  41463                   |
      | Blurb                 |  I want to speak German! |
      | Gender                |  Prefer Not to Say       |

    Then I should see "Welcome to Snack!"
    And I should see "Anna K."
    And I should see "I want to learn German!"