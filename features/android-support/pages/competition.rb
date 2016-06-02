require 'calabash-android/abase'
class Competition < Calabash::ABase
	def trait
		"* text:'Competitions'"
	end

	def check_subscreen_present(list)
		wait_for_elements_exist("all * text:'#{list.last}'")
		list.each do |screen|
			check_element_exists("all * text:'#{screen}'")
		end
	end

	def open_a_competition
		touch("* id:'iv_thumbnail' index:0")
	end

	def check_competition_detail_present(competition_name, competition_sections)
		check_element_exists("* text:'#{competition_name}'")
		wait_for(:timeout => 60){
			query("android.widget.HorizontalScrollView") != nil
			query("* id:'tv_tab_title'") != nil
		}
		competition_sections.each do |s|
			result = query("* text:'#{s}'")
			if result.nil?; pan("* id:'tabs_sliding'",:left) end
			wait_for_elements_exist("* text:'#{s}'")
			puts s
		end
	end
end