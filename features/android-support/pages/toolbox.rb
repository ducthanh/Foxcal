require 'calabash-android/abase'
class Toolbox < Calabash::ABase
  def trait
    "WebView css:'#press_pass'"
  end

  def check_webview_controls_present
    check_element_exists("* id:'iv_next_button'")
    check_element_exists("* id:'iv_refresh_button'")
    check_element_exists("* id:'iv_back_button'")
  end

  def login(username, password)
    touch("WebView css:'#press_pass'")
    wait_for_element_does_not_exist('activityIndicatorView')
    wait_poll(:until_exists => "WebView css:'#username'", :timeout => 20) do
      # binding.pry
      pan("* id:'webview'",:right)
    end
    enter_text("all webView css:'#username'","#{username}")
    enter_text("webView css:'#password'","#{password}")
    touch("webView css:'#regularsubmit'")
    wait_for_element_does_not_exist("webView css:'#regularsubmit'")
  end
end