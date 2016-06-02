require 'calabash-cucumber/ibase'
class Tvlist < Calabash::IBase
	def trait
		"webView css:'.espntv_heading'"
	end
end