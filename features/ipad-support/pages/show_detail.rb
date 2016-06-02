require 'calabash-cucumber/ibase'
class Showdt < Calabash::IBase
	def trait
		"* text:'EPISODES'"
	end

	def check_showdt_present
		check_element_exists("* text:'#{@shows_list[0].upcase}'") 
	end

	def find_locked_content
    wait_poll(:until_exists => "* id:'ic_lock'", :timeout => 20) do
      scroll("scrollView",:down)
    end
    touch("* id:'ic_lock'")
  end

  def open_episode
    wait_for_elements_exist "label {text BEGINSWITH 'Episode'}"
    touch "label {text BEGINSWITH 'Episode'}"
  end
end