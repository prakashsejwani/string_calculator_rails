Feature: String Calculator UI
  As a user
  I want to use the string calculator through a web interface
  So that I can calculate sums of numbers with various delimiters

  Background:
    Given I am on the home page

  Scenario: Calculate sum of empty string
    When I enter "" in the calculator
    And I click "Calculate"
    Then I should see "Result: 0"

  Scenario: Calculate sum of single number
    When I enter "5" in the calculator
    And I click "Calculate"
    Then I should see "Result: 5"

  Scenario: Calculate sum of two comma-separated numbers
    When I enter "1,5" in the calculator
    And I click "Calculate"
    Then I should see "Result: 6"

  Scenario: Calculate sum of multiple comma-separated numbers
    When I enter "1,2,3,4,5" in the calculator
    And I click "Calculate"
    Then I should see "Result: 15"

  Scenario: Calculate sum with newline delimiters
    When I enter "1\n2,3" in the calculator
    And I click "Calculate"
    Then I should see "Result: 6"

  Scenario: Calculate sum with custom single delimiter
    When I enter "//;\n1;2" in the calculator
    And I click "Calculate"
    Then I should see "Result: 3"

  Scenario: Calculate sum with long custom delimiter
    When I enter "//[***]\n1***2***3" in the calculator
    And I click "Calculate"
    Then I should see "Result: 6"

  Scenario: Calculate sum with multiple delimiters
    When I enter "//[*][%]\n1*2%3" in the calculator
    And I click "Calculate"
    Then I should see "Result: 6"

  Scenario: Calculate sum with multiple long delimiters
    When I enter "//[**][%%%]\n1**2%%%3" in the calculator
    And I click "Calculate"
    Then I should see "Result: 6"

  Scenario: Numbers greater than 1000 are ignored
    When I enter "2,1001" in the calculator
    And I click "Calculate"
    Then I should see "Result: 2"

  Scenario: Single number greater than 1000 returns 0
    When I enter "1001" in the calculator
    And I click "Calculate"
    Then I should see "Result: 0"

  Scenario: Negative numbers show error with all negatives listed
    When I enter "1,-2,3,-4" in the calculator
    And I click "Calculate"
    Then I should see "negative numbers not allowed -2,-4"

  Scenario: Malformed custom delimiter shows error
    When I enter "//[***]" in the calculator
    And I click "Calculate"
    Then I should see "Invalid custom delimiter format"
