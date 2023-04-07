Feature: Demo PUT API

  Background: 
    * url baseURL
    * header Accept = 'Application/json'
    * def requestBody = read('Request.json')

  #Simple PUT API
  Scenario: Simple PUT API
    Given path 'users/2'
    And request {"name": "Ranjith","job": "QA"}
    When method PUT
    Then status 200
    And print response
    And print responseStatus
    And print responseTime

  #Simple PUT API with external request file
  Scenario: Simple PUT API with external request file
    Given path '/users/2'
    And request requestBody
    When method PUT
    Then status 200
    And print response

  #Simple PUT API with Assertions
  Scenario: Simple PUT API with Assertions
    Given path '/users/2'
    And request requestBody
    When method PUT
    Then status 200
    And match response == {"name":"Ranjith Kumar","job":"QE","updatedAt":"#ignore"}
    And print response

  #Simple PUT API with Assertions using external response file
  Scenario: Simple PUT API with Assertions using external response file
    Given path '/users/2'
    And request requestBody
    And def responseBody = read('PutResponse.json')
    When method PUT
    Then status 200
    And match response == responseBody
    And print response
