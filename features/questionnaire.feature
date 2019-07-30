Feature: Users can view question and give responses through the browser
  Scenario: User loads category and sees questions with options
    When The user navigates to the correct category
    Then The user sees the question text

  Scenario: User loads test category and sees multiple questions
    When The user navigates to the correct category
    Then The user sees multiple questions

  Scenario: User answers question and reloads and answer persists
    When The user navigates to the correct category
    And The user inputs text
    And The user submits
    And The user navigates to the correct category
    Then The user should still see their answer
