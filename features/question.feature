Feature: We can generate RDF from question responses
  Scenario: User has selected an option for an organization
    Given A User with an organization
    When We have defined triples for o1
    And User has selected o1
    Then We can generate RDF triples for o1

  Scenario: Generate all RDF for a User
    Given A User with an organization
    When We have defined triples for o1
    And We have defined triples for o2
    And User has selected o1
    And User has selected o2
    Then We should generate RDF for o1 and o2

  Scenario: User unselects option
    Given A User with an organization
    When We have defined triples for o1
    And We have defined triples for o2
    And User has selected o1
    And User has selected o2
    And User has deselected o2
    Then We can generate RDF triples for o1

  Scenario: User activates organization
    Given A User
    And An Organization
    When User selects organization
    Then User should have organization

  Scenario: User without organization can't select options
    Given A User
    When We have defined triples for o1
    Then We should not be able to select o1
