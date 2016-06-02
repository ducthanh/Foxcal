Feature: autoracing - sport page
As a stakeholder I want to have a sport pages for showing the activities of an individual sport
So that user can watch the selected channel
Background:
	Given Get the autoracing sub-screen list
Scenario: open autoracing screen
	Given I am on home page screen
	And enable the sider bar
	And select the auto-racing sport screen
	Then I am on Autoracing screen
@android
Scenario: autoracing sub-screens
	Given open the Autoracing section
	Then I should see all Autoracing subscreen
@android @device @clip
Scenario: open clips
	Given open the Autoracing section
	And open the Clips section
	And open a Clips episodes
	Then I am on the epidose play screen
@android
Scenario: Sport competition
	Given open the Autoracing section
	And open the Competitions sub section
	And open F1 competition
	Then I should see all competition sub sections screen