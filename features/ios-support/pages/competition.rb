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
		touch(query("UIImageView").select{|e| e["frame"]["width"]==320&&e["frame"]["height"]==148 }[0])
	end

	def check_competition_detail_present
		sleep 0.5
		expect(query("UIImageView").select{|e| e["rect"]["height"]==200}.count).to eq 1
	end
end