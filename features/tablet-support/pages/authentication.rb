require 'calabash-android/abase'
class Authentication < Calabash::ABase
	def trait
		"webView css:'.provider'"
	end

	def check_webview_controls_present
		check_element_exists("* id:'iv_next_button'")
		check_element_exists("* id:'iv_refresh_button'")
		check_element_exists("* id:'iv_back_button'")
	end

	def press_pass_login
		wait_for_element_does_not_exist("android.widget.ProgressBar")
		touch("webView css:'div.providers-container:nth-child(7) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)'")
		@current_page = page(Presspass).await(timeout: 60)
		@current_page.login("2359test3@gmail.com", "12345678")
	end
end