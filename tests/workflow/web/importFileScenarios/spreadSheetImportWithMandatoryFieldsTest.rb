puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
SpreadSheetImport.importSpreadsheet($test_data['filename'])


#puts "style f: #{$test_data['style_fields']}"


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
Comman.verifySkuCountAndStatusOfStyle(1, "New", 1, 0)
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
Stylesgridpageobject.jobs.click
sleep 1
createNewStylebutton=Stylesgridpageobject.createNewStylesBtn
#puts Stylesgridpageobject.getStyleGridElement(createNewStylebutton).visible?
Stylesgridpageobject.getStyleGridElement(createNewStylebutton).click
#puts Stylesgridpageobject.createnewstylemodel.wait_until_present(20)
#puts Stylesgridpageobject.successful_style_creation.wait_until_present(20)
After.tear_down