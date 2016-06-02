require 'calabash-cucumber/ibase'
class Presspass < Calabash::IBase
	def trait
		"webView css:'input[value=Login]'"
	end

	def login(username, password)
		enter_text("webView css:'#username'","#{username}")
		enter_text("webView css:'#password'","#{password}")
		touch("webView css:'input[value=Login]'")
		wait_for_elements_do_not_exist("webView css:'input[value=Login]'")
		sleep 1
	end
end