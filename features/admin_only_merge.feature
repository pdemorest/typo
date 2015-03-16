Feature: Merge as Admin-only
  As a web designer
  In order to make sure not just anyone can merge articles together
  I want to be able to only allow admin users to see the merge option on the edit page

  Background:
    Given the blog is set up
    And the following articles exist:
    | title | author | content | 
    | A     | Alice  | Hello   |
    | B     | Bob    | World   |

  Scenario: Admin sees the merge option
    Given I am logged into the admin panel
    When I go to the edit article page for "A"
    Then I should see "Article ID"
    And I should see "Merge"

  Scenario: Non-Admin does not see the merge option
    Given I am logged into the publisher panel
    When I go to the edit article page for "A"
    Then I should not see "Article ID"
    And I should not see "Merge"
