Feature: Navigation
As a stakeholder
I want to see the navigator
So that I can user this bar to navigate to the sub screen among the application
or I can identify the screen name
@navigation
Scenario: nav bar elemements
	Given I am on home page screen
	Then I should see the logo in nav bar
@login @reinstall
Scenario: Login button
	Given I am on home page screen
	And enable the sider bar
	Then I should see the login button
@logout @reinstall
Scenario: Logout button
	Given I am on home page screen
	And enable the sider bar
	And click the login button
	And login
	Then I should see the log out button
Scenario: Term and condition
	Given I am on home page screen
	And enable the sider bar
	Then I should see the term and condition item
	And I select the term and condition item
	Then term and condition webview load properly
Scenario: FAQ
	Given I am on home page screen
	And enable the sider bar
	Then I should see the FQA item
	And I select FAQ item
	Then FQA webview load properly
@sportc
Scenario: Sport categories
	Given get the sport categories list from api
	And I am on home page screen 
	And enable the sider bar
	Then the categories list from api should be showed in the application