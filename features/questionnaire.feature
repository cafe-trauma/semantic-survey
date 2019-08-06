Feature: Users can view question and give responses through the browser
  Scenario: User answers text question and reloads and answer persists
    When The user navigates to the correct category
      And The user inputs text
      And The user submits q2
      And The user reloads the page
    Then The user should still see their answer

  Scenario: User answers radio question and reloads and answer persists
    When The user navigates to the correct category
      And The user picks first button
      And The user submits q5
      And The user reloads the page
    Then the first button should be checked

  Scenario: User answers select question and reloads and answer persists
    When The user navigates to the correct category
      And The user picks "first"
      And The user submits q3
      And The user reloads the page
    Then "first" should be selected

  Scenario: User answers checkbox question and reloads and answer persists
    When The user navigates to the correct category
      And The user checks "A"
      And The user checks "B"
      And The user submits q4
      And The user reloads the page
    Then "A" should be checked
      And "B" should be checked
      And "C" should not be checked
