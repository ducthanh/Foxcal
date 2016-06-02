require 'calabash-android/abase'
class Shows < Calabash::ABase
	def trait
		"* text:'SHOWS'"
	end

	def open_rd_show
		touch("* id:'iv_thumbnail' index:0")
	end
end