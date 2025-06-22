Feature: Add and Get the user details
 
  Scenario: Create details
    
    * def User = Java.type('Models.User')
    * def userObj = new User()
    * def userMap = userObj.toMap()
    * print 'Request payload:', userMap

     Given url 'https://reqres.in/api'
     And path 'users'
     And header Content-Type = 'application/json'
     And header x-api-key = 'reqres-free-v1'
     And request userMap
     When method POST
     Then status 201
     And print 'Response:', response

  Scenario: Get details

    Given url 'https://reqres.in/api'
    And path 'users'
    And param page = 2
    And header x-api-key = 'reqres-free-v1'
    When method GET
    Then status 200
