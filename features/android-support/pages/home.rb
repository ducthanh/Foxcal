require 'calabash-android/abase'
class Home < Calabash::ABase
	def trait
		"android.widget.ImageView id:'iv_title_left_menu'"
	end

	def enable_sider_bar
    wait_for_element_does_not_exist("android.widget.ProgressBar")
		wait_for(timeout: 60) do
			element_exists("* id:'iv_title_left_menu'")
    end
    touch("* id:'iv_title_left_menu'")
	end

	def find_and_tap(button, option = {})
		default = {:up => false}
    option = default.merge(option)
    if(option[:up])
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
	  wait_poll(:until_exists => "* id:'iv_lock'", :timeout => 20) do
	  	scroll("android.support.v7.widget.RecyclerView",:down)
	  end
	  touch("* id:'iv_lock'")
	end

	def check_app_logo_present
		check_element_exists("android.widget.ImageView id:'iv_title_logo'")
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
		if ENV['production']=="true"
			url = "https://fox-production.herokuapp.com/api/v1/countries"
		else
			url = "https://fox-staging.herokuapp.com/api/v1/countries"
		end
		source = RestClient.get url
		source = JSON.parse(source)
		kind = source.select{|i| i["name"].downcase.match get_country}[0]["auth_mechanism"]
  end

  def get_country
    if ENV['production']=="true"
      url = "http://admin.foxplayasia.com/get_country.json"
    else
      url = "https://fox-staging.herokuapp.com/get_country"
    end
    source = RestClient.get url
    source = JSON.parse(source)
    country = source["name"].downcase
  end

  def check_authentication_present(method)
    # binding.pry
    if method == 'OAuth'
      @current_page = page(OAuth).await(timeout: 60)
    elsif method == 'Toolbox'
      @current_page = page(Toolbox).await(timeout: 60)
    else
      raise "Cannot retrieve the login information"
    end
  end
end