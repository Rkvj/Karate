Feature: Demo GET API

  Background: 
    * url baseURL
    * header Accept = 'Application/json'

  #Simple GET API
  Scenario: Simple GET API
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print response
    And print responseStatus
    And print responseTime

  #Simple GET API with Param
  Scenario: Simple GET API
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

  #Simple GET API with Assertions
  Scenario: Simple GET API
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And assert response.data.length == 6
    And match response.data[0].id == 7
    And match $.data[0].first_name == 'Michael'
    
