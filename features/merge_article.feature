Feature: Merge Articles
  As a blog administrator
  In order to combine articles with similar content
  I want to be able to merge articles on my blog

  Background:
    Given the blog is set up
    And the existence of article with title "Blahtitle1" and text "Blahtext1" and ID 1
    And the existence of article with title "Blahtitle2" and text "Blahtext2" and ID 2



  Scenario: A non-admin cannot merge two articles (sad path)
    Given I am not logged in to the admin panel
    And I am on the edit page for "Blahtitle1"
    Then I should not see "Merge Article"

  Scenario: A non-admin cannot merge two articles (happy path)
    Given I am logged into the admin panel
    And I am on the edit page for "Blahtitle1"
    Then I should see "Merge Articles"


  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged into the admin panel
    When I am on the edit page for  "Blahtitle2" page
    And I fill in "merge_with" with "1"
    And I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Blahtitle1"
    And I should not see "Blahtitle2"
    When I follow "Blahtitle1"
    Then I should see "Blahtext1"
    And I should see "Blahtext2"







  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the two original articles).
  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.
  Scenario: The title of the new article should be the title from either one of the merged articles.
  Scenario: The form field containing the ID of the article to merge with must have the HTML attribute name set to merge_with.
