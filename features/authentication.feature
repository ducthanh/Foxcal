@au
Feature: Authentication
As a stakeholder
I want to add the authentication for the restricted content and unauthenticated for the free content
So that user authenticates to view the restricted content and able to view the free view without authentication
@reinstall @debug
Scenario: Authenticate view
	Given I am on home page screen
	And enable the sider bar
	And click the login button
	Then I am on the authentication screen
	Then I should see the close, refresh, back and foward button
@reinstal @debug
Scenario: Athetication dismission
	Given I am on home page screen
	And enable the sider bar
	And click the login button
	And login
	Then home screen should present
#@reinstall @device
#Scenario: open the lock content
#	Given I am on home page screen
#	And open the locked content
#	Then the authentication should be trigger
#	And login
#	Then I am on the epidose play screen