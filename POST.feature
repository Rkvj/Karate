Feature: Demo POST API

  Background: 
    * url baseURL
    * header Accept = 'Application/json'
    * def requestBody = read('Request.json')

  #Simple POST API
  Scenario: Simple POST API
    Given path '/users'
    And request {"name": "Ranjith","job": "QA"}
    When method POST
    Then status 201
    And print response
    And print responseStatus
    And print responseTime

  #Simple POST API with external request file
  Scenario: Simple POST API with external request file
    Given path '/users'
    And request requestBody
    When method POST
    Then status 201
    And print response

  #Simple POST API with Assertions
  Scenario: Simple POST API with Assertions
    Given path '/users'
    And request requestBody
    When method POST
    Then status 201
    And match response == {"name":"Ranjith Kumar","job":"QE","id":"#string","createdAt":"#ignore"}
    And print response

  #Simple POST API with Assertions using external response file
  Scenario: Simple POST API with Assertions using external response file
    Given path '/users'
    And request requestBody
    And def responseBody = read('Response.json')
    When method POST
    Then status 201
    And match response == responseBody
    And match $ == responseBody
    And print response
