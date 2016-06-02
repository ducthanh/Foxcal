require 'calabash-cucumber/ibase'
class OAuth < Calabash::IBase
	def trait
		"UIWebView marked:'Press Pass Sign In'"
	end

	def login(username, password)
		wait_for_element_does_not_exists('activityIndicatorView')
		touch("webView css:'div.providers-container:nth-child(7) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)'")
		wait_for_element_does_not_exists('activityIndicatorView')
		enter_text("webView css:'#username'","#{username}")
		enter_text("webView css:'#password'","#{password}")
		touch("webView css:'input[value=Login]'")
		wait_for_elements_do_not_exist("webView css:'input[value=Login]'")
		sleep 1
	end

	def check_webview_controls_present
		check_element_exists("* id:'nav_bt_forward'")
		check_element_exists("* id:'nav_bt_forward'")
	end
end