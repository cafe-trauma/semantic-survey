Feature: Users can view question and give responses through the browser
  Scenario: User loads category and sees questions with options
    Given We have defined triples for o1
    When The user navigates to the correct category
    Then The user sees the question text

  Scenario: User loads test category and sees multiple questions
    Given We have defined triples for o1
    And We have defined a triple with input
    When The user navigates to the correct category
    Then The user sees multiple questions
