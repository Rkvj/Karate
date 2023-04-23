Feature: Get runtime metadata such as the feature file name and scenario name

  Scenario: first scenario
    * def info = karate.info
    * print 'info:', info
    * match info contains { scenarioName: 'first scenario', featureFileName: 'Info.feature' }

  Scenario: second scenario
    * def info = karate.info
    * def directory = karate.properties['user.dir']+"\\target\\test-classes\\Test"
    * print directory
    * print 'info: ',info
    * match info ==
      """
      {
        "errorMessage": null,
        "featureDir": #(directory),
        "scenarioDescription": "",
        "scenarioName": "second scenario",
        "featureFileName": "Info.feature"
      }
      """
