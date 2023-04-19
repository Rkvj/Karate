Feature: Type Conversion

  Scenario: Number to String
    * def num = 10
    * def json = { "bar": #(num+'') }    #adding +'' will convert number to string
    * match json == { "bar" : '10' }

  Scenario: String to Number
    * def str = '10'
    * def json = { "bar" : #(str*1) }   #multiplying string with 1 will convert it t number
    * match json == { "bar" : 10 }
    * def json1 = { "bar" : #(parseInt(str)) }
    * match json1 == { "bar" : 10 }

  Scenario: Number to String
    * def num = 10
    * def json = num+''
    * match json =='10'

  Scenario: String to Number
    * def str = '10'
    * def json = str*1
    * match json == 10
    * def json1 = parseInt(str)
    * match json1 == 10
