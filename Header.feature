Feature: Header Content-type

  Background: 
    * url baseURL

  Scenario: Assert Content-type
    Given path '/users/2'
    When method GET
    And match header Content-Type contains 'application/json'
    And match header Content-Type == 'application/json; charset=utf-8'