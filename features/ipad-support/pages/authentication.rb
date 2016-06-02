require 'calabash-cucumber/ibase'
class Authentication < Calabash::IBase
	def trait
		"webView css:'.provider'"
	end

	def check_webview_controls_present
		check_element_exists("* id:'nav_bt_forward'")
		check_element_exists("* id:'nav_bt_forward'")
	end

	def press_pass_login
		# sleep 3
		wait_for_element_does_not_exists('activityIndicatorView')
		touch("webView css:'div.providers-container:nth-child(7) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)'")
		@current_page = page(Presspass).await(timeout: 60)
		@current_page.login("2359test3@gmail.com", "12345678")
	end
end