require 'calabash-android/abase'
class Presspass < Calabash::ABase
	def trait
		"webView css:'input[value=Login]'"
	end

	def login(username, password)
		wait_for_element_does_not_exist("android.widget.ProgressBar")
		enter_text("webView css:'#username'","#{username}")
		enter_text("webView css:'#password'","#{password}")
		touch("webView css:'input[value=Login]'")
	end
end