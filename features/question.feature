Feature: We can generate RDF from question responses
  Scenario: User has selected an option
    Given A User with an organization
    When We have defined triples for o1
    And User has selected o1
    Then We can generate RDF triples for o1

  Scenario: User has selected multiple options
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

  Scenario: User selects option with values
    Given A User with an organization
    When We have defined a triple with input
    And User has selected input with 5
    Then We can generate RDF with correct value of 5
