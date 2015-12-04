class SpreadSheetImport
  $job_id = nil

  def self.gotopageupload
    $method = __method__
   # puts $data_path

    Stylesgridpageobject.click_on_Styles

    Stylesgridpageobject.importstyles.click
    $browser.button(:text => "Upload").wait_until_present(20)
  end

  def self.badFileError
    $method = __method__
    return $browser.element(:css => ".alert-danger")
  end

  def self.importSpreadsheet(filename)
    $method = __method__
    SpreadSheetImport.gotopageupload
    file_to_be_upload = "#{$dataDir}/import_files/#{filename}"
    $browser.file_field(:id => "job_importData").set file_to_be_upload
    #sleep 5
    $browser.button(:text => "Upload").click
    sleep 5
    Stylesgridpageobject.getJobId
    #puts Stylesgridpageobject.getJobId
    $job_id = Stylesgridpageobject.getJobId
  end

  def self.mapColumns
    $method = __method__
    #Datamapping.brandNameLabel.wait_until_present(10)
    DataMapping.map_columns.wait_until_present(10)
    DataMapping.map_columns.click
    #Stylesgridpageobject.importstyles.wait_until_present(20)
  end

  def self.createJob
    return SpreadSheetImport.createJob("NewStyleSku.xls");
  end

  def self.createJob(spreadsheetname)
    jobid=SpreadSheetImport.importSpreadsheet(spreadsheetName)
    SpreadSheetImport.mapColumns
    Stylesgridpageobject.spreadSheetUploadMessage.visible?
    return jobid
  end

  def self.checkIfAtLeastOneJobExists
    numberOfJobs=Stylesgridpageobject.jobs.size;
    if (numberOfJobs==0)
      SpreadSheetImport.createJob

    end
  end


  def self.file_upload_verification(fileupload_verification_text)
    $method = __method__
    if ($browser.div(:class => "alert alert-danger alert-dismissable").present?) == true then
      sleep 1
      app_file_upload_error = $browser.div(:class => "alert alert-danger alert-dismissable").text
     # puts "app #{app_file_upload_error}"
     # puts "not app #{fileupload_verification_text}"
      if (app_file_upload_error.include? fileupload_verification_text) == false then
        exit -1
      end
    end
  end
end
