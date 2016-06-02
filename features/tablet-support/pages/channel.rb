require 'calabash-android/abase'
class Channel < Calabash::ABase
	def trait
		"* text:'Channels'"
	end

	def open_full_tvlist
		touch("* text:'View all TV Listings'")
	end
end