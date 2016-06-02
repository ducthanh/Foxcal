@show
Feature: Show
As a Stackholder I want to have the Show section
So that it presents all the show from the cms for user to watch
Background: 
	Given get shows list
Scenario: Open show screen
	Given I am on home page screen
	And open the show screen
	Then I am on the Show screen 
Scenario: Show page
	Given open the show screen
	And open a show
	Then I am on the show detail screen
@reinstall
Scenario: open locked show content without authentication
	Given open the show screen
	And open show that require authentication
	And I am on the Show page
	And open the locked episode
	Then I am on the authentication screen
@reinstall @device
Scenario: open locked show with the authenticated
	Given I am on home page screen
	And get the authentication
	And open the show screen
	And open show that require authentication
	And select a episodes item
	Then I am on the epidose play screen