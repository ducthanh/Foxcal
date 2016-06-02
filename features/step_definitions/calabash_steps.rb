Given(/^I am on home page screen$/) do
  @current_page= page(Home).await(timeout: 10)
end

Given(/^enable the sider bar$/) do
  @current_page= page(Home).await(timeout: 10)
  @current_page.enable_sider_bar
end

Given(/^click the login button$/) do
  @current_page.find_and_tap("LOGIN")
end

Then(/^I am on the authentication screen$/) do
  @current_page.check_authentication_present(@current_page.get_login_info)
end

Then(/^I should see the close, refresh, back and foward button$/) do
  #Android: doesn't has close button
  #Only check close button on iOS
  @current_page = page(Toolbox)
  @current_page ||= page(OAuth)
  # @current_page = page(Toolbox) || page(OAuth)
  @current_page.check_webview_controls_present 
end

Then(/^login$/) do
  login_method = @current_page.get_login_info
  if login_method == 'OAuth'
    @current_page = page(OAuth).await(timeout: 100)
    @current_page.login("2359test2@gmail.com","12345678")
  elsif login_method == 'Toolbox'
    @current_page = page(Toolbox).await(timeout: 100)
    @current_page.login("FIC_SG@fox.com","FIC_SG_STAFF")
  else
    raise "Cannot retrieve the login information"
  end
end

Then(/^home screen should present$/) do
  @current_page = page(Home).await(timeout: 60)
end

Given(/^open the locked content$/) do
  @current_page = page(Home).await(timeout: 60)
  @current_page.find_locked_content
end

Then(/^the authentication should be trigger$/) do
  @current_page.check_authentication_present(@current_page.get_login_info)
end

Then(/^The content should play automatically$/) do
  pending
end

Then(/^I should see the logo in nav bar$/) do
  @current_page = page(Home).await(timeout: 60)
  @current_page.check_app_logo_present
end

Then(/^I should see the login button$/) do
  @current_page.scroll_to("Login")
  @current_page.check_button_present("Login")
end

Then(/^I should see the log out button$/) do
  #check_element_exists("* text:'Logout'")
end

Then(/^I should see the term and condition item$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I select the term and condition item$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^term and condition webview load properly$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the FQA item$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I select FAQ item$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^FQA webview load properly$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^get the sport categories list from api$/) do
  url = "http://52.74.174.188/api/v1/pages.json"
  source = RestClient.get url
  sport_list = JSON.parse(source).map{|i| i["name"]}
  @list = sport_list.sort
end

Then(/^the categories list from api should be showed in the application$/) do
  @list.each do |name|
    @current_page.scroll_to(name)
    check_element_exists("* text:'#{name}'")
  end
end

Given(/^open the Channels screen$/) do
  step "enable the sider bar"
  @current_page.find_and_tap("LIVE TV", :up => true)
end

Then(/^I should see the channels list$/) do
  @current_page = page(Channel)
  touch(query("all view:'UITableViewCellContentView'").select{|e| e["frame"]["height"] == 110 && e["frame"]["width"] == 320}[1])
  actual = query("all view:'UITableViewCellContentView'").select{|e| e["frame"]["height"] == 110 && e["frame"]["width"] == 320}.count
  expect(actual).to eq @channel_number
end

Given(/^I am on the Channels screen$/) do
  @current_page = page(Channel).await(timeout: 10)
end

Given(/^tap View Full TV Listing button$/) do
  @current_page = page(Channel).await(timeout: 10)
  @current_page.open_full_tvlist
end

Then(/^The Full TV Listing should be opened$/) do
  @current_page.check_full_tvlist_present
end

And(/^get the authentication$/) do
  step "enable the sider bar"
  step "click the login button"
  step "I am on the authentication screen"
  step "login"
end

Given(/^I am in the Channels screen$/) do
  @current_page = page(Channel).await(timeout: 10)
end

Then(/^the Full TV Listing page open$/) do
  @current_page = page(Tvlist).await(timeout: 60)
end

Given(/^open the show screen$/) do
  step "enable the sider bar"
  @current_page.find_and_tap("Shows", :up => true)
end

Given(/^get shows list$/) do
  url = "http://52.74.174.188/api/v1/shows.json"
  source = RestClient.get url
  @shows_list = JSON.parse(source)[0]["shows"].map {|i| i["name"]}
end
Then(/^I am on the Show screen$/) do
  page(Shows).await(timeout: 60)
end

Given(/^open a show$/) do
  @current_page = page(Shows).await(timeout: 60)
  @current_page.open_rd_show
end

Then(/^I am on the show detail screen$/) do
  @current_page = page(Showdt).await(timeout: 60)
end

Given(/^open show that require authentication$/) do
  step "open a show"
end

Given(/^I am on the Show page$/) do
  @current_page = page(Showdt).await(timeout: 10)
end

Given(/^open the locked episode$/) do
  @current_page.find_locked_content
end

Given(/^select a episodes item$/) do
  @current_page = page(Showdt).await(timeout: 10)
  @current_page.open_episode
end 

Then(/^I am on the epidose play screen$/) do
  @current_page = page(Episode_play).await(timeout: 10)
end

Given(/^get the sports that are happening competition$/) do
  url = "http://52.74.174.188/api/v1/competitions.json"
  source = RestClient.get url
  @page_list = JSON.parse(source).map{|i| i["name"]}
end

Given(/^retrieve a competition information$/) do
  url = "http://52.74.174.188/api/v1/competitions.json"
  source = RestClient.get url
  cptt_info = JSON.parse(source)[0]["competitions"].first
  @cptt_id = cptt_info["id"]
  @cptt_name = cptt_info["name"]
  #get sub section
  url = "http://52.74.174.188/api/v1/competitions/#{@cptt_id}.json"
  source = RestClient.get url
  source = JSON.parse(source)
  @subsections = source["subpages"].map{|i| i["name"]}
end

Given(/^select competition section$/) do
  sleep 1
  @current_page.find_and_tap("Competitions")
end

Then(/^I am on the competition screen$/) do
  @current_page = page(Competition)
end

Given(/^open the competition screen$/) do
  step "I am on home page screen"
  step "enable the sider bar"
  step "select competition section"
end

Given(/^all sports that have competition display$/) do
  @current_page = page(Competition).await(timeout: 60)
  @current_page.check_subscreen_present(@page_list)
end

Given(/^select a competition$/) do
  @current_page = page(Competition).await(timeout: 60)
  @current_page.open_a_competition
end

Then(/^The competition details is present/) do
  @current_page.check_competition_detail_present(@cptt_name, @subsections)
end

Given(/^Get the autoracing sub\-screen list$/) do
  if ENV['production'] =="true"
    url = "http://admin.foxplayasia.com/api/v1/pages/50.json"
  else
    url = "http://staging.foxplayasia.com/api/v1/pages/50.json"
  end

  source = RestClient.get url
  source = JSON.parse(source)
  @autosc_list = source["sections"].map {|i| i["name"]}
end

Given(/^select the auto\-racing sport screen$/) do
  @current_page.find_and_tap("Motor Sports")
end

Then(/^I am on Autoracing screen$/) do
  @current_page = page(Autoracing).await(timeout: 15)
end

Given(/^open the Autoracing section$/) do
  step "I am on home page screen"
  step "enable the sider bar"
  step "select the auto-racing sport screen"
end

Then(/^I should see all Autoracing subscreen$/) do
  @current_page = page(Autoracing).await(timeout: 15)
  @current_page.check_subscreen_present(@autosc_list)
end

Given(/^open the Clips section$/) do
  @current_page = page(Autoracing).await(timeout: 15)
  @current_page.open_clips_screen
end

Given(/^open a Clips episodes$/) do
  @current_page.open_clips_episode
end

Given(/^open the Competitions sub section$/) do
  @current_page = page(Autoracing).await(timeout: 15)
  @current_page.scroll_to_tab("Competitions")
end

Given(/^open F1 competition$/) do
  @current_page.open_f1
end

Then(/^I should see all competition sub sections screen$/) do
  pending
end

Given(/^I should see all sports that have competition display$/) do
  pending
end

Given(/^login by press pass account$/) do
  pending
end

Given(/^I am on the home page screen$/) do
  pending
end

Given(/^look for the vod content$/) do
  pending
end

Given(/^share my watching content$/) do
  pending
end

Then(/^I should she the sharing options$/) do
  pending
end

Given(/^open the vod content$/) do
  pending
end

Given(/^select the facebook sharing$/) do
  pending
end

Given(/^log in the facebook$/) do
  pending
end

Then(/^the conten is shared succesfully$/) do
  pending
end

Given(/^select the twitter sharing$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^log in the twitter$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^select the email sharing$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am on the email sending screen$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^select the copy link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the link is copied successufully$/) do
  pending # express the regexp above with the code you wish you had
end


Then(/^I should see all videos$/) do
  pending # express the regexp above with the code you wish you had
end