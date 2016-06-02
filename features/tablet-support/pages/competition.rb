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

	def check_competition_detail_present
		expect(query("UIImageView").select{|e| e["rect"]["height"]==200}.count).to eq 1
	end

end