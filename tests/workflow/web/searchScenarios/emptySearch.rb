# puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
Dashboard.styles.click
sleep 2
Stylesgridpageobject.style_search.click
SearchStylesPageObject.search("Style ID", $test_data['style_id'].to_s)
#puts Searchstylespageobject.errorMessage.visible?
assert_equal((SearchStylesPageObject.errorMessage.visible?).to_s, "true", "The error message is missing")
SearchStylesPageObject.search("Event ID", $test_data['event_id'].to_s)
#puts Searchstylespageobject.errorMessage.visible?
assert_equal((SearchStylesPageObject.errorMessage.visible?).to_s, "true", "The error message is missing")
SearchStylesPageObject.search("Style Number", $test_data['style_num'].to_s)
#puts Searchstylespageobject.errorMessage.visible?
assert_equal((SearchStylesPageObject.errorMessage.visible?).to_s, "true", "The error message is missing")
SearchStylesPageObject.search("Style Name", $test_data['style_name'].to_s)
#puts Searchstylespageobject.errorMessage.visible?
assert_equal((SearchStylesPageObject.errorMessage.visible?).to_s, "true", "The error message is missing")
After.tear_down