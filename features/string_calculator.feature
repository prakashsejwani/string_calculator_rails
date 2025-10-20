@javascript
Feature: String Calculator UI
  As a user
  I want to calculate sums from a numbers string
  So that I can quickly compute results in the browser

  Background:
    Given I am on the home page

  Scenario: Empty string returns 0
    When I enter the numbers string:
      """
      
      """
    And I press Calculate
    Then I should see "Result: 0"

  Scenario: Single number returns itself
    When I enter the numbers string:
      """
      1
      """
    And I press Calculate
    Then I should see "Result: 1"

  Scenario: Two comma-separated numbers
    When I enter the numbers string:
      """
      1,2
      """
    And I press Calculate
    Then I should see "Result: 3"

  Scenario: Unknown amount of numbers
    When I enter the numbers string:
      """
      1,2,3,4,5
      """
    And I press Calculate
    Then I should see "Result: 15"

  Scenario: Newlines as delimiters
    When I enter the numbers string:
      """
      1\n2,3
      """
    And I press Calculate
    Then I should see "Result: 6"

  Scenario: Custom single-char delimiter
    When I enter the numbers string:
      """
      //;\n1;2
      """
    And I press Calculate
    Then I should see "Result: 3"

  Scenario: Negatives are not allowed
    When I enter the numbers string:
      """
      1,-2,3,-4
      """
    And I press Calculate
    Then I should see "negative numbers not allowed -2,-4"

  Scenario: Ignore numbers greater than 1000
    When I enter the numbers string:
      """
      2,1001
      """
    And I press Calculate
    Then I should see "Result: 2"

  Scenario: Any-length delimiter
    When I enter the numbers string:
      """
      //[***]\n1***2***3
      """
    And I press Calculate
    Then I should see "Result: 6"

  Scenario: Multiple delimiters
    When I enter the numbers string:
      """
      //[*][%]\n1*2%3
      """
    And I press Calculate
    Then I should see "Result: 6"

  Scenario: Multiple long delimiters
    When I enter the numbers string:
      """
      //[**][%%%]\n1**2%%%3
      """
    And I press Calculate
    Then I should see "Result: 6"


