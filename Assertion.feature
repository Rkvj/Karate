
Feature: Assertions

  Background: 
    * url baseURL

  #Simple Assertions
  Scenario: Simple Assertions
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And match response.total == 12
    And match response.data == '#[6]'
    And match response.data[*].name contains 'tigerlily'
    And match response..name contains 'tigerlily'
    And match response.data[*].name contains any ['tigerlily','Rk']      #we don't have Rk in the response
    And match response.data[*].name !contains 'Rk'

  #Assertions - Fuzzy matching
  Scenario: Fuzzy matching
    Given path '/users?page=2'
    When method GET
    Then status 200
    And match response.data =="#array"
    And match each response.data[*].name =="#string"
    #double hash means age key is optional
    And match each response.data[*].age =="##number"
    And match each response..name == "#string"
    And match each response..id == '#number'
    And match each response..year == "#number"
    And match each response..color == "#string"

  #Assert response - multiline comments
  Scenario: Assert response - multiline comments
    Given path '/users'
    And request {"name": "Ranjith","job": "QA"}
    When method POST
    Then status 201
    And print response
    And match response ==
      """
      {
      "name": "Ranjith",
      "job": "QA",
      "id": "#string",
      "createdAt": "#ignore"
      }
      """
