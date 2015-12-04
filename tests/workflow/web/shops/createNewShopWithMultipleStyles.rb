puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
Dashboard.shops.click
Shops.shopButton.when_present
Shops.shopButton.click
shopsId=Array.new
shopsId=Shops.shopsColoumn("Shop ID")
#puts shopsId
#puts "Veryfying the shops count in db with the Ui"
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
#puts $mysql_client
query="select id from shops order by id desc"
result=Comman.query_results(query)
shopsIDDb=Array.new
result.each do |print_rows|
# #   # puts "We"

# puts print_rows['id']
  shopsIDDb.push(print_rows['id'])
end
# puts "**************"
# puts shopsIDDb
# puts "**************"
# puts shopsId
assert_equal(shopsId,shopsIDDb, "The shops id from db doesnt match with the UI")
Shops.createNewShopButton.click
time=Time.now.to_i
#puts time
ShopsNewPage.selectSomeTextField("Shop name").wait_until_present
ShopsNewPage.selectSomeTextField("Shop name").send_keys"#{$test_data['name']}:#{time}"
ShopsNewPage.date("startDate").send_keys"#{$test_data['start_date']}"
ShopsNewPage.date("endDate").send_keys"#{$test_data['end_date']}"
#ShopsNewPage.visibleInNavigation.click
ShopsNewPage.saveButton.click

assert_equal(ShopsStylesPageobject.successfulMessage($test_data['successfulShopsCreationMessage'].to_s).visible?.to_s,"true", "The shops was not created succeessfully")
parameters_for_shop=Hash.new
sleep 2
parameters_for_shop=ShopsStylesPageobject.shopParameters
query="select * from shops order by id desc limit 1"
result=Comman.query_results(query)
shop_Id=0
result.each do |print_rows|
# #   # puts "We"

# puts print_rows['id']
#puts parameters_for_shop["start_date"].to_s.encode("iso-8859-1").force_encoding("utf-8")[0..19]
  shop_Id=print_rows['id'].to_i
  assert_equal(print_rows['id'].to_s,parameters_for_shop["id"].to_s,"The shop id doesnt match with the db")
  assert_equal(print_rows['shop_name'].to_s,parameters_for_shop["shop_name"].to_s,"The shop name doesnt match with the db")
  assert_equal(print_rows['start_date'].to_s.encode("iso-8859-1").force_encoding("utf-8")[0..18],parameters_for_shop["start_date"].to_s.encode("iso-8859-1").force_encoding("utf-8")[0..19],"The shop start date doesnt match with the db")
  assert_equal(print_rows['end_date'].to_s.encode("iso-8859-1").force_encoding("utf-8")[0..18],parameters_for_shop["end_date"].to_s.encode("iso-8859-1").force_encoding("utf-8")[0..19],"The shop end date doesnt match with the db")
  assert_equal(print_rows['visible'].to_s.encode("iso-8859-1").force_encoding("utf-8"),parameters_for_shop["visible"].to_s.encode("iso-8859-1").force_encoding("utf-8"),"The shop visible in nav doesnt match with the db")
end
#query="delete from shops order by id desc limit 1"
#result=Comman.query_results(query)
ShopsStylesPageobject.searchStyleButton.click
sleep 2
puts "Size of input"+$test_data['style_id'].size.to_s
SearchStylesPageObject.multipleSearch("Style ID", $test_data['style_id'])
ShopsStylesPageobject.selectMultipleStyles($test_data['style_id'])
ShopsStylesPageobject.addStyletoShop.click
sleep 2
ShopsStylesPageobject.checkStylesShopTable($test_data['style_id'])
ShopsStylesPageobject.checkStylesShopTable($test_data['style_id'][0])
query="delete from shops where id=#{shop_Id}"
result=Comman.query_results(query)
query="delete from shops_styles where shop_id=#{shop_Id}"
result=Comman.query_results(query)
After.tear_down