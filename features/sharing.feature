Feature: sharing 
As an user, I want to share the upcomming media or my watched video to the social media sites
So that my friends/connection are able to see my sharing link and my application
Scenario: tap into the sharing button
	Given I am on the home page screen
	And look for the vod content
	And share my watching content
	Then I should she the sharing options
Scenario: facebook sharing
	Given open the vod content 
	And share my watching content
	And select the facebook sharing
	And log in the facebook
	Then the conten is shared succesfully
Scenario: twitter sharing
	Given open the vod content 
	And share my watching content
	And select the twitter sharing
	And log in the twitter
	Then the conten is shared succesfully
Scenario: email sending
	Given open the vod content 
	And share my watching content
	And select the email sharing
	Then I am on the email sending screen
Scenario: copy link
	Given open the vod content
	And share my watching content
	And select the copy link
	Then the link is copied successufully