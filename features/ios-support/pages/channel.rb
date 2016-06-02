require 'calabash-cucumber/ibase'
class Channel < Calabash::IBase
	def trait
		"* text:'CHANNELS'"
	end

	def open_full_tvlist
		touch("* text:'View Full TV Listings'")
	end

	def check_full_tvlist_present
		
	end
end