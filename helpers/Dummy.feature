Feature: Dummy

  Scenario: Dummy
    * def data = Java.type('helpers.DataGenerator')
    * def userName = data.getRandomUsername()
    * print userName
