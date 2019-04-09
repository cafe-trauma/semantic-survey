Feature: Users can fill out questionnaires for multiple organizations
  Scenario: User activates organization
    Given A User
    And An Organization
    When User selects organization
    Then User should have organization

  Scenario: User without organization can't select options
    Given A User
    When We have defined triples for o1
    Then We should not be able to select o1
