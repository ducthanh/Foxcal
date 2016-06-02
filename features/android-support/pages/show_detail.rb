require 'calabash-android/abase'
class Showdt < Calabash::ABase
	def trait
		"* text:'Episodes'"
	end

	def open_episode
		touch("* id:'iv_thumbnail' index:0")
	end

	def find_locked_content
    wait_poll(:until_exists => "* id:'iv_lock'", :timeout => 20) do
      scroll("scrollView",:down)
    end
    touch("* id:'iv_lock'")
  end
end