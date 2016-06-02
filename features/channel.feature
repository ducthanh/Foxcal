@channel
Feature: Channel
As a stakeholder I want to have a Channels section for showing the avaiable channels
So that user can watch the selected channel
@reinstall
Scenario:Open Channels without authenticate
	Given I am on home page screen
	And open the Channels screen
	Then I am on the authentication screen
@reinstall
Scenario:Open Channels with authenticates
	Given I am on home page screen
	And get the authentication 
	And open the Channels screen
	Then I am on the Channels screen
@reinstall
Scenario: View Full TV Listing
	Given I am on home page screen
	And get the authentication 
	And open the Channels screen
	Given I am in the Channels screen
	And tap View Full TV Listing button
	Then the Full TV Listing page open