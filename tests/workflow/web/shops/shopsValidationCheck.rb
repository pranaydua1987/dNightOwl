puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
Dashboard.shops.click
Shops.shopButton.when_present
Shops.shopButton.click
Shops.createNewShopButton.click
ShopsNewPage.saveButton.click
sleep 1
assert_equal(ShopsNewPage.validationErrorMessage1("#{$test_data['shop_name_id']}","#{$test_data['blank_message']}").visible?.to_s,"true","Shop name blank error messgae not visible")
assert_equal(ShopsNewPage.validationErrorMessage1("#{$test_data['shop_start_date_id']}","#{$test_data['blank_message']}").visible?.to_s,"true","Shop start date blank error messgae not visible")
assert_equal(ShopsNewPage.validationErrorMessage1("#{$test_data['shop_end_date_id']}","#{$test_data['blank_message']}").visible?.to_s,"true","Shop end date blank error messgae not visible")
time=Time.now.to_i
ShopsNewPage.selectSomeTextField("Shop name").send_keys"#{$test_data['name']}:#{time}"
ShopsNewPage.date("startDate").send_keys"#{$test_data['start_date']}"
ShopsNewPage.date("endDate").send_keys"#{$test_data['wrong_end_date']}"
#ShopsNewPage.visibleInNavigation.click

ShopsNewPage.saveButton.click
assert_equal(ShopsNewPage.validationErrorMessage1("#{$test_data['shop_end_date_id']}","#{$test_data['date_validation_message']}").visible?.to_s,"true","Shop end date validation error messgae not visible")
# ShopsNewPage.date("endDate").send_keys""
# ShopsNewPage.date("endDate").send_keys"#{$test_data['end_date']}"
# ShopsNewPage.saveButton.click
# assert_equal(ShopsNewPage.validationErrorMessage1("#{$test_data['shop_end_date_id']}","#{$test_data['date_validation_message']}").visible?.to_s,"false","Shop end date validation error messgae not visible")
After.tear_down