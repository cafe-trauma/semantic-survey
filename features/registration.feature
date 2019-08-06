Feature: Users can visit site and start questionnaires
  Scenario: A new user visits home page and must register
    When user first loads homepage
      And clicks "Begin Questionnaire" button
    Then should be prompted for an email

  Scenario: A new user registers a new email and is asked which questionnaire to take
    When user first loads homepage
      And clicks "Begin Questionnaire" button
      And types "bob@example.com" into "Email"
      And clicks "Register" button
    Then asked which questionnaire to begin

  Scenario: A user attempts to register with an existing email
    When user first loads homepage
      And clicks "Begin Questionnaire" button
      And types "existing@example.com" into "Email"
      And clicks "Register" button
    Then told email is already registered
