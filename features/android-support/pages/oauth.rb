require 'calabash-android/abase'
class OAuth < Calabash::ABase
  def trait
    "WebView css:'.provider'"
  end

  def check_webview_controls_present
    check_element_exists("* id:'iv_next_button'")
    check_element_exists("* id:'iv_refresh_button'")
    check_element_exists("* id:'iv_back_button'")
  end

  def login(username, password)
    wait_for_element_does_not_exist("android.widget.ProgressBar")
    touch("webView css:'div.providers-container:nth-child(7) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)'")
    wait_for_element_does_not_exist("android.widget.ProgressBar")
    enter_text("webView css:'#username'","#{username}")
    enter_text("webView css:'#password'","#{password}")
    touch("webView css:'input[value=Login]'")
    wait_for_elements_do_not_exist("webView css:'input[value=Login]'")
    sleep 1
  end
end