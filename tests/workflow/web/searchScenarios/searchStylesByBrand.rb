puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
Dashboard.styles.click
sleep 2
Stylesgridpageobject.style_search.click
# puts "reached here "
# sleep 3
#mysql_client("10.224.5.188","hautelook","hautelook","hautelook")
#puts "hello1"
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
# puts $mysql_client
# puts $test_data['brand_id']
brandStylesCount=0
nameStylesCount=0
styleNumStylesCount=0
eventIdStylesCount=0

query="select count(*) from styles where brand_id=#{$test_data['brand_id']}"
result=Comman.query_results(query)


result.each do |print_rows|
# #   # puts "We"

  #puts print_rows['count(*)']
  brandStylesCount=print_rows['count(*)']
end
query="select count(*) from styles where name=\"#{$test_data['style_name']}\""
result=Comman.query_results(query)


result.each do |print_rows|
  # #   # puts "We"

  #puts print_rows['count(*)']
  nameStylesCount=print_rows['count(*)']
end
query="select count(*) from styles where style_num=#{$test_data['style_num']}"
result=Comman.query_results(query)


result.each do |print_rows|
  # #   # puts "We"

 # puts print_rows['count(*)']
  styleNumStylesCount=print_rows['count(*)']
end
query="select count(*) from events_styles where event_id=#{$test_data['event_id']}"
result=Comman.query_results(query)


result.each do |print_rows|
  # #   # puts "We"

  # puts print_rows['count(*)']
  eventIdStylesCount=print_rows['count(*)']
end
# puts "Styles count for the brand from DB: " + brandStylesCount.to_s
# puts "Styles count for the style name from DB: " + nameStylesCount.to_s
# puts "Styles count for the style number from DB: " + styleNumStylesCount.to_s
# puts "Styles count for the event from DB: " + eventIdStylesCount.to_s
#  search by brand
SearchStylesPageObject.search("Brand Name", "Moovboot")
SearchStylesPageObject.searchButton.click
Grid.gridroot
search_results_row=Grid.getRows_all
#puts search_results_row.size
assert_equal(search_results_row.size, brandStylesCount, "The correct style count must be returned")

# verify that the edit style buttons all load and have valid URLs
edit_buttons=Array.new
edit_buttons=SearchStylesPageObject.actionButton("Edit")
#puts edit_buttons.size
assert_equal(edit_buttons.size, brandStylesCount, "Edit Style buttons are not displayed as expected.")
edit_buttons.each do |edit_button|
  sURL=edit_button.attribute_value "href"
  #puts sURL
  #  puts sURL.include? "/styles/"
  assert_equal((sURL.include? "/styles/").to_s, "true", "Edit button URLs must contain styles in the string")
end
# verify that the view events buttons all load and have valid URLs

events_buttons=Array.new
events_buttons=SearchStylesPageObject.actionButton("Events")
#puts events_buttons.size
assert_equal(events_buttons.size, brandStylesCount, "View Events buttons are not displayed as expected.")
events_buttons.each do |event_button|
  sURL=event_button.attribute_value "href"
  #puts sURL
  #  puts sURL.include? "/styles/"
  assert_equal((sURL.include? "viewStyleEventsModal").to_s, "true", "View events button URLs must be correct")
end
# verify that the view SKUs buttons all load and have valid URLs
skus_buttons=Array.new
skus_buttons=SearchStylesPageObject.actionButton("SKUs")
#puts skus_buttons.size
assert_equal(skus_buttons.size, brandStylesCount, "View Events buttons are not displayed as expected.")
skus_buttons.each do |sku_buttons|
  sURL=sku_buttons.attribute_value "href"
  #puts sURL
  #  puts sURL.include? "/styles/"
  assert_equal((sURL.include? "viewStyleSkusModal").to_s, "true", "View SKUs button URLs must be correct")
end
# verify that the view Persistent buttons all load and have valid URLs
persistent_buttons=Array.new
persistent_buttons=SearchStylesPageObject.actionButton("Persistent")
#puts persistent_buttons.size
assert_equal(persistent_buttons.size, brandStylesCount, "View Events buttons are not displayed as expected.")
persistent_buttons.each do |persistent_button|
  sURL=persistent_button.attribute_value "href"
  #puts sURL
  #  puts sURL.include? "/styles/"
  assert_equal((sURL.include? "viewPersistentInfoModal").to_s, "true", "View Persistent button URLs must be correct")
end
# qq22 = $mysql_client.query(query)
# puts qq22
# brandStylesCount=0
# qq22.each do |print_rows|
# #   # puts "We"
# #   puts print_rows
# # end
# puts print_rows
# #sbrandStylesCount=print_rows['count(*)']
# end
# puts brandStylesCount
After.tear_down