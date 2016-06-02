require 'calabash-android/abase'
class Channel < Calabash::ABase
	def trait
		"* text:'NOW PLAYING'"
	end

	def open_full_tvlist
		touch("* text:'View Full TV Listings'")
	end
end