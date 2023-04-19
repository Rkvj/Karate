Feature: Sleep

  Background: 
    * url baseURL

  #Retry logic
  Scenario: Sleep logic
    * def sleep = function(duration){ java.lang.Thread.sleep(duration) }
    Given path '/users?page=2'
    When method GET
    * eval sleep(10000)
    Then status 200
