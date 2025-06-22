Feature: Add and Get the user details

Background:
  * def TestDataStore = Java.type('DataStore.TestDataStore')

Scenario: Create details
  * def User = Java.type('Models.UserCreationModel')
  * def userObj = new User()
  * def userMap = userObj.toMap()
  * print 'Request payload:', userMap

  Given url 'https://gorest.co.in'
  And path 'public', 'v2', 'users'
  And header Content-Type = 'application/json'
  And header Authorization = 'Bearer de7d574dd697fd2862e7c9214a9cda120b8f63662399395662f3c34c1373af85'
  And request userMap
  When method POST
  Then status 201
  * print 'Response:', response
  * TestDataStore.put('userId', response.id)
  * TestDataStore.put('name', response.name)

Scenario: Get and Update user details in one flow
  * def userId = TestDataStore.get('userId')

  Given url 'https://gorest.co.in'
  And path 'public', 'v2', 'users', userId
  And header Authorization = 'Bearer de7d574dd697fd2862e7c9214a9cda120b8f63662399395662f3c34c1373af85'
  When method GET
  Then status 200
  * def userDetails = response
  * def originalEmail = userDetails.email
  * def randomNumber = Math.floor(Math.random() * 10000)
  * def parts = originalEmail.split('@')
  * def newEmail = parts[0] + '+' + randomNumber + '@' + parts[1]
  * def newName = userDetails.name + randomNumber
  * userDetails.name = newName
  * userDetails.email = newEmail

  Given url 'https://gorest.co.in'
  And path 'public', 'v2', 'users', userId
  And header Content-Type = 'application/json'
  And header Authorization = 'Bearer de7d574dd697fd2862e7c9214a9cda120b8f63662399395662f3c34c1373af85'
  And request userDetails
  When method PUT
  Then status 200
  And match response.name == newName
  And match response.email == newEmail
  
Scenario: Delete details
  * def userId = TestDataStore.get('userId')

  Given url 'https://gorest.co.in'
  And path 'public', 'v2', 'users', userId
  And header Authorization = 'Bearer de7d574dd697fd2862e7c9214a9cda120b8f63662399395662f3c34c1373af85'
  When method DELETE
  Then status 204


