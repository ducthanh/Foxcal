require 'calabash-android/abase'
class Autoracing < Calabash::ABase
	def trait
		"* text:'Auto Racing'"
	end

	def check_subscreen_present(list)
		wait_for_elements_exist("all * text:'#{list.last}'")
		list.each do |screen|
			check_element_exists("all * text:'#{screen}'")
		end
	end

	def open_clips_screen
		touch("* text:'Clips'")
	end

	def open_clips_episode
		touch("* id:'iv_thumbnail'")
	end

	def scroll_to_tab(tab_name)
		wait_poll(:until_exists => "* text:'#{tab_name}'", :timeout => 20) do
			pan("* id:'tabs_sliding'",:left)
		end
		touch("* text:'#{tab_name}'")
	end
end