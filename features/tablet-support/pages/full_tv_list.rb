require 'calabash-android/abase'
class Tvlist < Calabash::ABase
	def trait
		"webView css:'.espntv_heading'"
	end
end