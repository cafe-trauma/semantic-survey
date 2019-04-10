Feature: Users can view question and give responses through the browser
  Scenario: User loads category and sees questions with options
    Given We have defined triples for o1
    When The user navigates to the correct category
    Then The user sees the question text
