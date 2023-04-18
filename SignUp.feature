Feature: Sign Up new user

    Background: Preconditions
        * def dataGenerator = Java.type('helpers.DataGenerator')
        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUsername = dataGenerator.getRandomUsername()
        * url 'https://conduit.productionready.io/api/'

    Scenario: New user Sign Up
        Given path 'users'
        And request
        """
            {
                "user": {
                    "email": #(randomEmail),
                    "password": "123Karate123",
                    "username": #(randomUsername)
                }
            }
        """
        When method Post
        Then status 200
        And print response
        And match response ==
        """
            {
                "user": {                    
                    "email": #(randomEmail),
                    "username": #(randomUsername),
                    "bio": null,
                    "image":  "#string",
                    "token": "#string"
                }
            }
        """

    Scenario Outline: Validate Sign Up error messages
        Given path 'users'
        And request
        """
            {
                "user": {
                    "email": "<email>",
                    "password": "<password>",
                    "username": "<username>"
                }
            }
        """
        When method Post
        Then status 422
        And match response == <errorResponse>

        Examples:
            | email                | password  | username               | errorResponse                                                                      |  
            | #(randomEmail)       | Karate123 | KarateUser123          | {"errors":{"username":["has already been taken"]}}                                 |
            | KarateUser1@test.com | Karate123 | #(randomUsername)      | {"errors":{"email":["has already been taken"]}}                                    |
            | KarateUser1          | Karate123 | #(randomUsername)      | {"errors":{"email":["has already been taken"]}}                                                |
            