require 'calabash-cucumber/ibase'
class Toolbox < Calabash::IBase
	def trait
		"UIWebView css:'#press_pass'"
	end

	def login(username, password)
		touch("UIWebView css:'#press_pass'")
		wait_for_element_does_not_exists('activityIndicatorView')
		wait_poll(:until_exists => "UIWebView css:'#username'", :timeout => 20) do
			scroll("view:'_UIWebViewScrollView'",:right)
		end
		enter_text("all webView css:'#username'","#{username}")
		enter_text("webView css:'#password'","#{password}")
		touch("webView css:'#regularsubmit'")
		wait_for_element_does_not_exists("webView css:'#regularsubmit'")
		while (query("*").select{|i| i["frame"]["height"]==130}.count == 0)
			sleep 1
		end
	end

	def check_webview_controls_present
		check_element_exists("* id:'nav_bt_forward'")
		check_element_exists("* id:'nav_bt_forward'")
	end
end
