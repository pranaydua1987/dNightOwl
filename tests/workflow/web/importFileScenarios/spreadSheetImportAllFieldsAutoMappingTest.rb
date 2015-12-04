puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
SpreadSheetImport.importSpreadsheet($test_data['filename'])


puts "style f: #{$test_data['style_fields']}"


$test_data['style_fields'].each do |key, val|
  DataMapping.verify_field_mapping(key, val)
end


$test_data['SKU_Fields'].each do |key, val|

  DataMapping.verify_field_mapping(key, val)
end
$test_data['Inventory_fields'].each do |key, val|

  DataMapping.verify_field_mapping(key, val)
end

$test_data['Business_Classification_Fields'].each do |key, val|

  DataMapping.verify_field_mapping(key, val)
end
SpreadSheetImport.mapColumns
Stylesgridpageobject.spreadSheetUploadMessage($test_data['filename'])
Comman.verifySkuCountAndStatusOfStyle(1, "New", 2, 0)
Stylesgridpageobject.editStylesBtn(1).present?
Stylesgridpageobject.editStylesBtn(1).click
styleInfo=Hash.new
styleInfo=SingleStyleEdit.getStyle
skuInfo=Array.new
skuInfo=SingleStyleEdit.getGrid
SingleStyleEdit.EditBizClassBtn.click
Edit_business_class.validate_button.wait_until_present(10)
buss_class_mappings=Array.new
buss_class_mappings=Edit_business_class.get_Business_classification
#puts buss_class_mappings
Edit_business_class.validate_button.click
createNewStylebutton=Stylesgridpageobject.createNewStylesBtn
#puts"createNewStylebutton"
Stylesgridpageobject.jobs.click
sleep 1
#puts Stylesgridpageobject.getStyleGridElement(createNewStylebutton).visible?
Stylesgridpageobject.getStyleGridElement(createNewStylebutton).click
#puts Stylesgridpageobject.createnewstylemodel.wait_until_present(20)
#puts Stylesgridpageobject.successful_style_creation.wait_until_present(20)
#Stylesgridpageobject.cross_button.click
#createNewStylesButtonDisabled=Stylesgridpageobject.createNewStylesBtnDisabled
#Stylesgridpageobject.getStyleGridElement(createNewStylesButtonDisabled).wait_until_present(20)
#puts "disabled create new style button"+Stylesgridpageobject.getStyleGridElement(createNewStylesButtonDisabled).visible?

mysqlClient("dbmaster.staging.hautelook.net", "hautelook", "hautelook", "hautelook")
query="select * from styles s inner join brands b using(brand_id) where s.style_num ='#{styleInfo["styleNumber"]}' and brand ='#{styleInfo["brand"]}'"
#puts query
Comman.verifyStyleRows(styleInfo)
After.tear_down
# query="select * from styles s inner join brands b using(brand_id) where s.style_num ='NordStyle10132355324286' and brand ='Ivanka Trump'"
# puts query
# qq22 = $mysql_client.query(query)
# # puts qq.to_s
# puts qq22
# qq22.each do |print_rows|
#   # puts "We"
#   puts print_rows
# end
#puts qq.num_rows
# while row = qq.fetch_hash do
#     printf "%s, %s\n", row["0"], row["1"]
#   end
# qq.each do |i|
#   puts i.join("/s")
#   end
