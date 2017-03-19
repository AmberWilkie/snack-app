Feature: As a Language Learner
  in order to see the popularity of the site
  I would like to view users on a big map

  Background:
    Given the following users exist:
      | email           | name | location |
      | anna@random.com | Anna | 41463    |
      | ben@random.com  | Ben  | 41463    |
      | jon@random.com  | Jon  | 41460    |
      | ale@random.com  | Ale  | 41304    |

  @javascript
  Scenario: I view the map on the index page
    Given I am on the "home" page
    Then I expect a map to load
    And I should see a map with "3" markers
    When I click the first marker
    Then I should see "2 language learner(s)"