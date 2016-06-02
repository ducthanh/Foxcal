require 'calabash-cucumber/ibase'
class Competition < Calabash::IBase
	def trait
		"* text:'Competitions'"
	end

	def check_subscreen_present(list)
		wait_for_elements_exist("all * text:'#{list.last.upcase}'")
		list.each do |screen|
			check_element_exists("all * text:'#{screen.upcase}'")
		end
	end

	def open_a_competition
		touch(query("UIImageView").select{|e| e["frame"]["width"]==170&&e["frame"]["height"]==235 }[0])
	end

	def check_competition_detail_present
		check_element_exists "* id:'segment_background'"
	end
end