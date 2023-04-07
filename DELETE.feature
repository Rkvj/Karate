Feature: Demo DELETE API

  Background: 
    * url baseURL
    * header Accept = 'Application/json'

  Scenario: Simple DELETE API
    Given path '/users/2'
    When method DELETE
    Then status 204
    And print response
