require 'calabash-android/management/adb'
require 'calabash-android/operations'

Before do |scenario|
	clear_app_data
  start_test_server_in_background
  # scenario_tags = scenario.source_tag_names
  # if scenario_tags.include?('@reinstall')
  #   clear_app_data
  # end
end

# After do |scenario|
#   if scenario.failed?
#     screenshot_embed
#   end
#   shutdown_test_server
# end

After do |scenario|
  shutdown_test_server
end