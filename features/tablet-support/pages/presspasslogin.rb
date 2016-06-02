require 'calabash-android/abase'
class Presspass < Calabash::ABase
	def trait
		"webView css:'input[value=Login]'"
	end

	def login(username, password)
		wait_for_element_does_not_exist("android.widget.ProgressBar", timeout: 120)
		enter_text("webView css:'#username'","#{username}")
		sleep 0.2
		enter_text("webView css:'#password'","#{password}")
		sleep 0.5
		touch("webView css:'input[value=Login]'")
	end
end