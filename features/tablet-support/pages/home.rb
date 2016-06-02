require 'calabash-android/abase'
class Home < Calabash::ABase
	def trait
		"android.widget.ImageView id:'iv_title_logo'"
	end

	def enable_sider_bar
		wait_for_elements_exist("all * id:'iv_title_left_menu'")
		sleep 5
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

	# def find_locked_content
	#   wait_poll(:until_exists => "* id:'iv_lock'", :timeout => 20) do
	#   	scroll("scrollView",:down)
	#   end
	#   touch("* id:'iv_lock'")
	# end

	def find_locked_content
    wait_poll(:until_exists => "* text:'Replays'", :timeout => 20) do
    	scroll("android.support.v7.widget.RecyclerView",:down)
    end
    
    wait_poll(:until_exists => "* id:'iv_lock'", :timeout => 20) do
      scroll("android.support.v7.widget.RecyclerView",:down)
    end
    touch "* id:'iv_lock' index:1"
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
end