require 'calabash-cucumber/ibase'
class Home < Calabash::IBase
	def trait
    "* id:'ic_menu'"
  end

  def enable_sider_bar
    touch("* id:'ic_menu'")
    wait_for_elements_do_not_exist("* id:'logo'")
  end

  def find_and_tap(button, option={})
    default = {:up => false}
    option = default.merge(option)
      if option[:up]
        wait_poll(:until_exists =>"* text:'#{button}'", :timeout => 20) do 
          scroll("scrollView",:up)
        end
      else
        wait_poll(:until_exists =>"* text:'#{button}'", :timeout => 20) do 
        scroll("scrollView",:down)
        end
      end
    touch("* text:'#{button}'")
  end

  def find_locked_content
    wait_poll(:until_exists => "* id:'ic_lock'", :timeout => 20) do
      scroll("scrollView",:down)
    end
    touch("* id:'ic_lock'")
  end

  def check_app_logo_present
    check_element_exists("* id:'logo'")
  end

  def check_button_present(name)
    wait_poll(:until_exists =>"* text:'#{name}'", :timeout => 20) do 
      scroll("scrollView",:down)
    end
    check_element_exists("* text:'#{name}'")
  end

  def scroll_to(button)
    wait_poll(:until_exists =>"* text:'#{button}'", :timeout => 20) do 
      scroll("scrollView",:down)
    end
  end

  def get_login_info
    url = "https://fox-staging.herokuapp.com/api/v1/countries"
    source = RestClient.get url
    source = JSON.parse(source)
    kind = source.select{|i| i["name"].downcase.match get_country}[0]["auth_mechanism"]
  end

  def get_country
    url = "http://52.74.174.188/get_country"
    source = RestClient.get url
    source = JSON.parse(source)
    country = source["name"].downcase
  end

  def check_authentication_present(method)
    if method == 'OAuth'
      @current_page = page(OAuth).await(timeout: 60)
    elsif method == 'Toolbox'
      @current_page = page(Toolbox).await(timeout: 60)
    else
      raise "Cannot retrieve the login information"
    end
  end
end