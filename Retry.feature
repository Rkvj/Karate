Feature: Retry

  Background: 
    * url baseURL

  #Retry logic
  Scenario: Retry logic
  * configure retry = { count: 5, interval: 5000 }
    Given path '/users?page=2'
    And retry until response.data[0].id == 0
    When method GET
    Then status 200
    And print response