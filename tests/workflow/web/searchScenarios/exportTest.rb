puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
Dashboard.styles.click
sleep 2
Stylesgridpageobject.style_search.click
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
#puts $mysql_client
#puts $test_data['style_id']
styleIdCount=0
query="select count(*) from styles where style_id=\"#{$test_data['style_id']}\""
result=Comman.query_results(query)
result.each do |print_rows|
  # #   # puts "We"

  puts print_rows['count(*)']
  styleIdCount=print_rows['count(*)']
end
#puts "Styles count for the style number from DB: " + styleIdCount.to_s
# puts "Styles count for the event from DB: " + eventIdStylesCount.to_s
#  search by brand
SearchStylesPageObject.search("Style ID", $test_data['style_id'].to_s)
Grid.gridroot
search_results_row=Grid.getRows_all
#puts search_results_row.size
assert_equal(search_results_row.size, styleIdCount, "The correct style count must be returned")
SearchStylesPageObject.exportButton.click
sleep 1
SearchStylesPageObject.exportLink.click
#SearchStylesPageObject.handleAlert
After.tear_down