Feature: Users can create an account

  Scenario: I create my account and view my profile page
    Given I am on the "registration" page
    When I fill in:
      | Email              | Password    | Password Confirmation    | Name       | Location                         | Blurb                      | Gender               |
      | ------------------ | ----------- | ------------------------ | ---------- | -------------------------------  | -------------------------- | -------------------- |
      | email@random.com   | password    | password                 | Anna K.    | Bangatan 11, Gothenburg 41463    | I want to learn German!    | Prefer Not to Say    |
    Then I should see "Welcome to Snack!"
    And I should see "Anna K."
    And I should see "I want to learn German!"