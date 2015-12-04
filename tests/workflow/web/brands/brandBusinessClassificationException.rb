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
if (BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").set?.to_s =="true")

  # assert_equal(brandAllowPersistentCatalog.to_s, "1", "Incorrect value for Allow Persistent Catalog ")
  BrandsPageObject.brandDetails("Is Allowed in Persistent Catalog?").clear
  BrandsPageObject.selectSaveButton("brand_details").click
  sleep 30
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
  assert_equal(brandsNewSkuCount.to_s, "0", "sku count doesnt match ")
end
query="select count(distinct sc.sku)
    from
    sku_classification sc, skus, styles, brands
    where sc.sku = skus.sku
    and skus.style_id = styles.style_id
    and styles.brand_id = brands.brand_id
    and brands.brand_id = #{$test_data['brand_id']}
    and sc.business_member_classification_id in (
        select id
        from `taxonomy_business_member_classification`
        where business_classification_id in (select id from taxonomy_business_classification
            where lft >
            (select lft from taxonomy_business_classification
            where id = #{$test_data['business_classification_id']})
            and rgt <
            (select rgt from taxonomy_business_classification
            where id = #{$test_data['business_classification_id']})
        )
    )"
result=Comman.query_results(query)
affectedSkuCount=0
result.each do |print_rows|
  # #   # puts "We"
 # puts print_rows['count(distinct sc.sku)']
  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  affectedSkuCount=print_rows['count(distinct sc.sku)']
end
puts "AfftectedSkeCount:"+affectedSkuCount.to_s
sleep 5
# Comman.scrollToElement(BrandsPageObject.businessClassificationDropDown("SP SHOES"))
eleBox = BrandsPageObject.businessClassificationDropDown("#{$test_data['business_division']}")

sleep 3

puts eleBox.present?
eleBox.click
sleep 2
BrandsPageObject.businessClassificationCheckBox("#{$test_data['business_department']}").wait_until_present
BrandsPageObject.businessClassificationCheckBox("#{$test_data['business_department']}").click
BrandsPageObject.selectSaveButtonDiv("business-class-inclusion-panel").click
sleep 40
query="select count(sku) from styles inner join skus using (style_id) where styles.brand_id=#{$test_data['brand_id']} and skus.allow_persistent_catalog=1"
result=Comman.query_results(query)
newAffectedSkuCount=0
result.each do |print_rows|
  # #   # puts "We"
  puts print_rows['count(sku)']
  #puts "allow_persistent_catalog :#{print_rows['allow_persistent_catalog']}"
  newAffectedSkuCount=print_rows['count(sku)']
end
puts "NewAffectedSkuCount"+newAffectedSkuCount.to_s
assert_equal(affectedSkuCount.to_s, newAffectedSkuCount.to_s, "sku count doesnt match ")
eleBox1 = BrandsPageObject.businessClassificationDropDown("#{$test_data['business_division']}")

sleep 3


#puts eleBox1.present?
#eleBox1.click
#sleep 2
#BrandsPageObject.businessClassificationCheckBox("#{$test_data['business_department']}").wait_until_present
BrandsPageObject.businessClassificationCheckBox("#{$test_data['business_department']}").click
BrandsPageObject.selectSaveButtonDiv("business-class-inclusion-panel").click
After.tear_down