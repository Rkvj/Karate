Feature: Fetch value from external file

Background: 
    * url baseURL
    
    
  Scenario: Fetch data from external file and assert response  
    Given path '/users'
    #And def filePath = karate.properties['user.dir']+ '/src/test/java/helpers/DataGenerator.java'
    #And def dataGenerator = filePath
    And def dataGenerator = Java.type('helpers.DataGenerator')    
    And def userName = dataGenerator.getRandomUsername()
    And request 
    """
    {
    "name": #(userName),
    "job": "QA"
    }
    """
    When method POST
    Then status 201
    And match response.name == userName
