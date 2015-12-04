puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
SpreadSheetImport.importSpreadsheet($test_data['filename'])
SpreadSheetImport.mapColumns
Stylesgridpageobject.editStylesBtn(1).click
skuInfo=Array.new
skuInfo=SingleStyleEdit.getGrid
puts skuInfo
i=0
skuInfo.each do |sku|
  #puts sku["Size"]
  assert_equal($test_data['Sizes'][i], sku["Size"])
  i=i+1
end
After.tear_down