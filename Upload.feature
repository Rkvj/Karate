Feature: File upload

  Scenario: Image upload
    Given url 'https://api.imgur.com/3/upload'
    And multipart file img = {read:'Karate.jpg', filename: 'Karate.jpg', contentType: 'application/json'}
    When method POST
    Then status 200
