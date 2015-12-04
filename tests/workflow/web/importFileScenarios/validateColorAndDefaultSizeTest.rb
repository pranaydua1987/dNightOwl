puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
SpreadSheetImport.importSpreadsheet($test_data['filename'])
SpreadSheetImport.mapColumns
DataMapping.select_some_text_field("Default Size").clear
#puts $test_data['Test_data_1'][0]
#puts $test_data['Error_Message_1'][0]
DataMapping.select_some_text_field("Default Size").set($test_data['Test_data_1'][0])
SpreadSheetImport.mapColumns
#puts Datamapping.error_message($test_data['Error_Message_1'][0].join(","))

# puts $test_data['Test_data_1'][1]
assert_equal("pass", DataMapping.error_message($test_data['Error_Message_1'][0]).to_s)
DataMapping.select_some_text_field("Default Size").clear
DataMapping.select_some_text_field("Default Size").set($test_data['Test_data_1'][1])
SpreadSheetImport.mapColumns
assert_equal("pass", DataMapping.error_message($test_data['Error_Message_1'][1]).to_s)
DataMapping.select_some_text_field("Default Size").clear
DataMapping.select_some_text_field("Default Size").set($test_data['Test_data_1'][2])
SpreadSheetImport.mapColumns
assert_equal(true, Stylesgridpageobject.spreadSheetUploadMessage($test_data['filename']).visible?)
#puts (Stylesgridpageobject.getStyleGridElements(Stylesgridpageobject.greenRowsOnStylesGrid)).size
assert_equal((Stylesgridpageobject.getStyleGridElements(Stylesgridpageobject.greenRowsOnStylesGrid)).size, 2, "Green rows not displayed as expected")
After.tear_down