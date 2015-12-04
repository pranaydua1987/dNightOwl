puts __FILE__
Login.initialize_browser($config['browserff'], $config['qa_url'])
Login.login_workflow($config['username'], $config['password'])
Dashboard.links_check
Dashboard.icons_check
SpreadSheetImport.importSpreadsheet($test_data['filename'])
SpreadSheetImport.file_upload_verification($test_data['file_upload_error'])
After.tear_down
