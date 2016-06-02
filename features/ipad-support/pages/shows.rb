require 'calabash-cucumber/ibase'
class Shows < Calabash::IBase
	def trait
		"* id:'Shows'"
	end

	def open_rd_show
		wait_for_elements_exist("UIImageView index:1}'")
		sleep 1
		touch(query("UIImageView").select{|e| e["rect"]["height"]==235}[0])
	end
end