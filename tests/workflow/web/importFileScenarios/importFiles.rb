puts __FILE__
Login.initialize_browser($test_data['browser'], $test_data['url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
SpreadSheetImport.importSpreadsheet("ExistingStyles.xls")
SpreadSheetImport.mapColumns
Dashboard.logout
After.tear_down