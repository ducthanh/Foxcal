require 'calabash-cucumber/ibase'
class Home < Calabash::IBase
	def trait
    "* id:'ic_menu'"
  end
  
  def enable_sider_bar
    touch("* id:'ic_menu'")
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
    wait_poll(:until_exists => "* text:'REPLAYS'", :timeout => 20) do
      scroll("scrollView",:down)
    end
    wait_poll(:until_exists => "* id:'ic_lock'", :timeout => 20) do
      scroll("scrollView",:down)
    end
    touch "* id:'ic_lock' index:1"
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
end