Feature: Merge Articles
  As a blog administrator
  In order to make similar articles appear in the same place
  I want to be able to merge articles

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    When I create the article "Bunnies" with description "Bunnies have ears"
    And I also create the article "Rabbits" with description "Rabbits have fluffy tails"
    And leave a comment, "Bunnies are awesome", for "Bunnies"
    And also leave a comment, "Rabbits are cool", for "Rabbits"
    Given I am on the edit article page for "Bunnies"
    And I fill in "Article ID" with the ID for "Rabbits"
    And I press "Merge"
    Then I should be on the admin content page

  Scenario: Successfully merges title of two articles
    When I go to the home page
    Then I should see "Bunnies"
    But I should not see "Rabbits"

  Scenario: Successfully merges text of two articles
    When I go to the home page
    Then I should see "Bunnies"
    When I follow "Bunnies"
    Then I should see "Bunnies have ears"
    And I should see "Rabbits have fluffy tails"

  Scenario: Successfully merges author of two articles
    When I go to the home page
    Then I should see "admin"
    #But I should not see "other author"
    #can't figure out how to access articles by other authors... is this because my sidebar isn't rendering?

  Scenario: Successfully merges comments of two articles
    When I go to the home page
    Then I should see "Bunnies"
    When I follow "Bunnies"
    And I follow "1 comment"
    Then I should see "Bunnies are awesome"
    And I should see "Rabbits are cool" 

