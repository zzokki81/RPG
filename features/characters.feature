Feature: Characters
  All users can see characters
  But only logged in users can create, edit and delete  characters

  Background:
    Given I am a registered user
    And I visit the homepage
    And I fill in the login form
    And I visit the homepage

  Scenario: View all characters
    Given I visit the homepage
    Then I click on characters page

  Scenario: Adding a new character
    When I click on create new character
    When I create new character
    Then I have created a new character

  Scenario: Editing character
    Given I create new character
    When I click on characters page
    When I edit character
    Then I edited my character

  Scenario: Deleting character
    Given I create new character
    When I have created a new character
    Then I click to delete the character
