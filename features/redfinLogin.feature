Feature: Login Action
 
Scenario: Successful Login with Valid Credentials
	Given I navigate to redfin login page
	And I enter "garettpetersen1@gmail.com" into the email field
	And I enter "Gunner1619" into the password field
	When I click the Sign in button
	Then Message displayed Login Successfully with text "Sell for more"