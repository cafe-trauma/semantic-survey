Feature: We can generate RDF from question responses
  Scenario: User has selected an option
    Given A User
    When We have defined triples for o1
    And User has selected o1
    Then We can generate RDF triples for o1

  Scenario: Generate all RDF for a User
    Given A User
    When We have defined triples for o1
    And We have defined triples for o2
    And User has selected o1
    And User has selected o2
    Then We should generate RDF for o1 and o2
