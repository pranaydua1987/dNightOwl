puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
Dashboard.styles.click
sleep 2
Stylesgridpageobject.style_search.click
SearchStylesPageObject.search("Brand Name", $test_data['old_brand_name'])
#SearchStylesPageObject.enableMultiEdit.visible?
SearchStylesPageObject.searchButton.click
sleep 2
SearchStylesPageObject.enableMultiEdit.click
sleep 2
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
StyleIds=Array.new
StyleIds=MutltiEdit.selectMultipleStyles(3)

StyleIds.each do |id|
  #puts |id|
  query="select brand from styles inner join brands using(brand_id) where style_id=#{id}"
  result=Comman.query_results(query)


  result.each do |print_rows|
# #   # puts "We"

    #puts print_rows['brand']
    brand_name=print_rows['brand']
    assert_equal(brand_name,$test_data['old_brand_name'] , "The brand name is different")
  end
end

#puts StyleIds
MutltiEdit.updateSelected.click
sleep 5
MutltiEdit.newBrandName("#{$test_data['new_brand_name']}")
MutltiEdit.saveButton.click
sleep 2
MutltiEdit.acceptAlert
MutltiEdit.closeButton.click
sleep 4
StyleIds.each do |id|
  #puts |id|
      query="select brand from styles inner join brands using(brand_id) where style_id=#{id}"
  result=Comman.query_results(query)


  result.each do |print_rows|
# #   # puts "We"

    #puts print_rows['brand']
    new_brand_name=print_rows['brand']
    assert_equal(new_brand_name,"#{$test_data['new_brand_name']}" , "The brand name is different")
  end
end
## Setting the brand back to original
SearchStylesPageObject.removeSearchedBrand("#{$test_data['old_brand_name']}").click
SearchStylesPageObject.search("Brand Name", $test_data['new_brand_name'])
#SearchStylesPageObject.enableMultiEdit.visible?
SearchStylesPageObject.searchButton.click
sleep 2
SearchStylesPageObject.enableMultiEdit.click
sleep 2
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
StyleIds=Array.new
StyleIds=MutltiEdit.selectMultipleStyles(3)

StyleIds.each do |id|
  #puts |id|
  query="select brand from styles inner join brands using(brand_id) where style_id=#{id}"
  result=Comman.query_results(query)


  result.each do |print_rows|
# #   # puts "We"

#puts print_rows['brand']
    brand_name=print_rows['brand']
    assert_equal(brand_name,$test_data['new_brand_name'] , "The brand name is different")
  end
end

#puts StyleIds
MutltiEdit.updateSelected.click
sleep 5
MutltiEdit.newBrandName("#{$test_data['old_brand_name']}")
MutltiEdit.saveButton.click
sleep 2
MutltiEdit.acceptAlert
MutltiEdit.closeButton.click
sleep 4
StyleIds.each do |id|
  #puts |id|
  query="select brand from styles inner join brands using(brand_id) where style_id=#{id}"
  result=Comman.query_results(query)


  result.each do |print_rows|
# #   # puts "We"

#puts print_rows['brand']
    new_brand_name=print_rows['brand']
    assert_equal(new_brand_name,"#{$test_data['old_brand_name']}" , "The brand name is different")
  end
end
SearchStylesPageObject.disableMultiEdit.click
After.tear_down