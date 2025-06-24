Feature: Register user Data driven approch

Scenario Outline: Data Driven Testing Approch
  * def payload = { email: '<email>', password: '<password>' }
  
  Given url 'https://reqres.in/api/register'
  And header Content-Type = 'application/json'
  And header x-api-key = 'reqres-free-v1'
  And request payload
  When method POST
  Then status 200
  And match response == { id: '#number', token: '#string' }

Examples:
  | email              | password   |
  | eve.holt@reqres.in | cityslicka |
  | eve.holt@reqres.in | pistol     |