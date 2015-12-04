Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
#Dashboard.styles.click
sleep 2
brandUrl=$config['qa_url'].gsub('login','brand')
brandUrl="#{brandUrl}/#{$test_data['brand_id']}"
#puts brandUrl
Comman.navigate(brandUrl)
BrandsPageObject.brandHeading("Brand Details").wait_until_present

## Validating the Allow in Persistent flag for a Brand
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
if (BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").set?.to_s =="true")

  # assert_equal(brandAllowPersistentCatalog.to_s, "1", "Incorrect value for Allow Persistent Catalog ")
  BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").clear
  BrandsPageObject.selectSaveButton("brand_details").click
  sleep 40
  #counter=30

  query="select count(sku) from styles inner join skus using (style_id) where styles.brand_id=#{$test_data['brand_id']} and skus.allow_persistent_catalog=1"
  result=Comman.query_results(query)
  brandsNewSkuCount=0
  result.each do |print_rows|
    # #   # puts "We"
    puts print_rows['count(sku)']
    #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
    brandsNewSkuCount=print_rows['count(sku)']
  end
  puts "brandsNewSkuCount:"+brandsNewSkuCount.to_s
  assert_equal(brandsNewSkuCount.to_s, "0".to_s, "sku count doesnt match ")
end
query="select style_id from styles where brand_id=#{$test_data['brand_id']}"
result=Comman.query_results(query)
stylesBelongingToBrand=Array.new
result.each do |print_rows|
  # #   # puts "We"
  # puts print_rows['count(distinct sc.sku)']
  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  stylesBelongingToBrand.push(print_rows['style_id'])
end
puts stylesBelongingToBrand
BrandsPageObject.addStyleButton.click
sleep 2
SearchStylesPageObject.search("Style ID",stylesBelongingToBrand[0])
BrandsPageObject.addStyleCustomerChoices.click
BrandsPageObject.selectCustomerChoices(stylesBelongingToBrand[0])
sleep 2
BrandsPageObject.selectSaveButtonDiv("customer-choice-inclusion").click
sleep 3
query="select count(sku) from skus where style_id=#{stylesBelongingToBrand[0]}"
puts query
skusBelongingToStyle=0
result=Comman.query_results(query)
result.each do |print_rows|
  # #   # puts "We"
  # puts print_rows['count(distinct sc.sku)']
  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  puts print_rows['count(sku)']
  skusBelongingToStyle=print_rows['count(sku)']
  puts skusBelongingToStyle
end
sleep 10
query="select count(sku) from skus where style_id=#{stylesBelongingToBrand[0]} and allow_persistent_catalog=1"
skuAllowPersistentCatalog=0
result=Comman.query_results(query)
result.each do |print_rows|
  puts print_rows['count(sku)']
  # #   # puts "We"
  # puts print_rows['count(distinct sc.sku)']
  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  skuAllowPersistentCatalog=print_rows['count(sku)']
  puts skuAllowPersistentCatalog
end
puts skusBelongingToStyle.to_s
puts skuAllowPersistentCatalog.to_s
assert_equal(skusBelongingToStyle,skuAllowPersistentCatalog,"Skus Allow Persistent Catalog field hasnt updated")
BrandsPageObject.deleteCustomerChoices(stylesBelongingToBrand[0])
sleep 10
query="select count(sku) from skus where style_id=#{stylesBelongingToBrand[0]} and allow_persistent_catalog=0"
skuNotAllowPersistentCatalog=0
result.each do |print_rows|
  # #   # puts "We"
  # puts print_rows['count(distinct sc.sku)']
  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  skuNotAllowPersistentCatalog=print_rows['count(sku)']
end
assert_equal(skusBelongingToStyle,skuNotAllowPersistentCatalog,"Skus Allow Persistent Catalog field hasnt updated")