Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
#Dashboard.styles.click
sleep 2
brandUrl=$config['qa_url'].gsub('login','brand')
brandUrl="#{brandUrl}/#{$test_data['brand_id']}"
puts brandUrl
Comman.navigate(brandUrl)
BrandsPageObject.brandHeading("Brand Details").wait_until_present

## Validating the Allow in Persistent flag for a Brand
mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
query="select allow_persistent_catalog from brands where brand_id=\"#{$test_data['brand_id']}\""
result=Comman.query_results(query)
brandAllowPersistentCatalog=0
brandSkusCount=0
result.each do |print_rows|
  # #   # puts "We"

  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  brandAllowPersistentCatalog=print_rows['allow_persistent_catalog']
end
query="select count(sku) from styles inner join skus using (style_id) where styles.brand_id=#{$test_data['brand_id']}"
result=Comman.query_results(query)
result.each do |print_rows|
puts print_rows['count(sku)']
  brandSkusCount=print_rows['count(sku)']
end
#puts BrandsPageObject.brandDetails("Allow Persistent Catalog:")
puts "checkbox Status:"+BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").set?.to_s
if (BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").set?.to_s =="true")

  assert_equal(brandAllowPersistentCatalog.to_s, "1", "Incorrect value for Allow Persistent Catalog ")
  #BrandsPageObject.selectBrandDetailsRadioButton("Allow Persistent Catalog:",1).click
  BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").clear
  BrandsPageObject.selectSaveButton("brand_details").click
  sleep 30
  #counter=30

  query="select count(sku) from styles inner join skus using (style_id) where styles.brand_id=#{$test_data['brand_id']} and skus.allow_persistent_catalog=0"
  result=Comman.query_results(query)
  brandsNewSkuCount=0
  result.each do |print_rows|
    # #   # puts "We"
puts print_rows['count(sku)']
    #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
    brandsNewSkuCount=print_rows['count(sku)']
  end
  assert_equal(brandsNewSkuCount.to_s, "#{brandSkusCount}", "sku count doesnt match ")
elsif (BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").set?.to_s =="false")

  assert_equal(brandAllowPersistentCatalog.to_s, "0", "Incorrect value for Allow Persistent Catalog ")
  #BrandsPageObject.selectBrandDetailsRadioButton("Allow Persistent Catalog:",0).click
  BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").set
  BrandsPageObject.selectSaveButton("brand_details").click
  sleep 30
  query="select count(sku) from styles inner join skus using (style_id) where styles.brand_id=#{$test_data['brand_id']}  and skus.allow_persistent_catalog=1"
  result=Comman.query_results(query)
  brandsNewSkuCount=0
  result.each do |print_rows|
    # #   # puts "We"
    puts print_rows['count(sku)']
    #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
    brandsNewSkuCount=print_rows['count(sku)']
  end
  assert_equal(brandsNewSkuCount.to_s, "#{brandSkusCount}", "sku count doesnt match ")
end
After.tear_down