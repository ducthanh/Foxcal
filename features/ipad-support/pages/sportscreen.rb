require 'calabash-cucumber/ibase'
class Autoracing < Calabash::IBase
	def trait
		"* text:'AUTO RACING'"
	end

	def open_f1
		touch("* id:'iv_thumbnail'")
	end
end