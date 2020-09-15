Feature: User Authentication

  In order to use the website as a user I should be able to sign up, log in and log out

  Scenario: Sign up
    Given I visit the homepage
    When I click sign up and fill in the form
    Then I should be signed up

  Scenario: Login
    Given I am a registered user
    And I visit the homepage
    When I fill in the login form
    Then I should be logged in

  Scenario: User Logs Out
    Given I am a registered user
    And I should be logged in
    And I visit the homepage
    And I fill in the login form
    And I visit the homepage
    When I click the log out button
    Then I visit the homepage
