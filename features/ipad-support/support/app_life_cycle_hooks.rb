require 'calabash-cucumber'
Before do |scenario|
	@calabash_launcher = Calabash::Cucumber::Launcher.new
  scenario_tags = scenario.source_tag_names
  if scenario_tags.include?('@reinstall')
    @calabash_launcher.reset_simulator
  end
  start_test_server_in_background
end

After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end