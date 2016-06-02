require 'calabash-cucumber/ibase'
class Channel < Calabash::IBase
	def trait
		"* text:'View Full TV Listing'"
	end

	def open_full_tvlist
		touch("* text:'View Full TV Listing'")
	end

	def check_full_tvlist_present
		puts "errrr"
	end
end