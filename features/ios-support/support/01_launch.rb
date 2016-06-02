# require 'calabash-cucumber/launcher'

# Before('@reinstall') do
#   ENV['RESET_BETWEEN_SCENARIOS'] = '1'
# end

# Before do |scenario|
#   @calabash_launcher = Calabash::Cucumber::Launcher.new
#   scenario_tags = scenario.source_tag_names
#   unless @calabash_launcher.calabash_no_launch?
#     @calabash_launcher.relaunch()
#     @calabash_launcher.calabash_notify(self)
#   end
#   ENV['RESET_BETWEEN_SCENARIOS'] = ''
# end

# After do |scenario|
#   unless @calabash_launcher.calabash_no_stop?
#     calabash_exit
#     if @calabash_launcher.active?
#       @calabash_launcher.stop
#     end
#   end
# end
