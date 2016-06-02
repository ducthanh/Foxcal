@competition
Feature: Competition
As a stakeholder I want to have a Competition section for showing the avaiable channels
So that user can watch the selected channel
Background:
  Given get the sports that are happening competition
Scenario:Open competition screen
  Given I am on home page screen
  And enable the sider bar
  And select competition section
  Then I am on the competition screen
@android
Scenario:verify the competition subscreen
  Given open the competition screen
  And I should see all sports that have competition display
Scenario: competition details
  Given retrieve a competition information
  And open the competition screen
  And select a competition
  Then The competition details is present
Scenario: check the competition details video list
  Given open the competition screen
  And select a competition
  Then I should see all videos