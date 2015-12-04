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
if (BrandsPageObject.brandDetails("Is Nordstrom Product Group Brand?").set?.to_s =="true")
  query="select is_npg from brands where brand_id=#{$test_data['brand_id']}"
  result=Comman.query_results(query)
  brandNordstromBrand=0
  result.each do |print_rows|
    brandNordstromBrand=print_rows['is_npg']
  end
  assert_equal(brandNordstromBrand.to_s, "1", "Incorrect value for Nordstrom Brand")
  BrandsPageObject.brandDetails("Is Nordstrom Product Group Brand?").clear
  BrandsPageObject.selectSaveButton("brand_details").click
  sleep 3
  result=Comman.query_results(query)
  brandNordstromBrand=0
  result.each do |print_rows|
    brandNordstromBrand=print_rows['is_npg']
  end
  assert_equal(brandNordstromBrand.to_s, "0", "Incorrect value for Nordstrom Brand ")
elsif(BrandsPageObject.brandDetails("Is Nordstrom Product Group Brand?").set?.to_s =="false")
  query="select is_npg from brands where brand_id=#{$test_data['brand_id']}"
  result=Comman.query_results(query)
  brandNordstromBrand=0
  result.each do |print_rows|
    brandNordstromBrand=print_rows['is_npg']
  end
  assert_equal(brandNordstromBrand.to_s, "0", "Incorrect value for Allow Persistent Catalog ")
  BrandsPageObject.brandDetails("Is Nordstrom Product Group Brand?").set
  BrandsPageObject.selectSaveButton("brand_details").click
  sleep 3
  result=Comman.query_results(query)
  brandNordstromBrand=0
  result.each do |print_rows|
    brandNordstromBrand=print_rows['is_npg']
  end
  assert_equal(brandNordstromBrand.to_s, "1", "Incorrect value for Allow Persistent Catalog ")
end
After.tear_down