class Stylesgridpageobject
  def self.button_checks
    $method = __method__
    $browser.a(:text => "Jobs").wait_until_present(20)
    $browser.a(:text => "Add Style").wait_until_present(20)
    $browser.a(:text => "Import Styles").wait_until_present(20)
    $browser.a(:class => "btn btn-primary dropdown-toggle").wait_until_present(20)
  end

  def self.add_Styles
    $method = __method__
    return $browser.a(:text => "Add Style")
  end

  def self.style_search
    $method = __method__
    return $browser.a(:href => "/styles")
  end

  def self.click_on_Styles
    $method = __method__
    $browser.a(:text => "Styles").click
    $browser.a(:text => "Import Styles").wait_until_present(10)
  end

  def self.jobs
    $method = __method__
    return $browser.a(:text => "Jobs")
  end

  def self.importstyles
    $method = __method__
    return $browser.a(:text => "Import Styles")
  end

  def self.deleteStylesJob
    $method = __method__
    sleep 10
    # $browser.a(:class => "btn btn-link btn-default").click
  end

  def self.getJobId
    $method = __method__
    current_url=$browser.url
    return current_url.split("/").last
    # $browser.a(:class => "btn btn-link btn-default").click
  end

  def self.spreadSheetUploadMessage(spreadsheet)

    # verify spreadSheetUploadMessage on the grid

    uploadMessage=$browser.h2(:xpath => "//h2[@class='panel-title panel-title-lg pull-left' and contains(.,'"+spreadsheet+"')]")
    #this.driver.findElement(By.xpath(s));
    return uploadMessage


  end

  def self.updateExistingStylesBtn
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(3)"
  end

  def self.createnewstylemodel
    $method = __method__
    return $browser.h4(:text => "Creating New Styles")
  end

  def self.successful_style_creation
    $method = __method__
    return $browser.i(:class => "fa fa-2x fa-check")
  end

  def self.cross_button
    $method = __method__
    return $browser.button(:xpath => "//div[contains(@class,'modal-header')]/p/button[@class='close']")
  end

  def self.updateAlert
    $method = __method__
    return "#successful-update-alert-jobID"
  end

  def self.updateExistingStylesBtnDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > .btn-success[disabled]:nth-child(3)"
  end

  def self.createNewStylesBtn
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(4)"
  end

  def self.createNewStylesBtnDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > .btn-success[disabled]:nth-child(4)"
  end

  # /* These buttons got removed
  # // reviewStylesBtn="#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(3)";
  #
  # // reviewStylesBtnDisabled="#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > .btn-success[disabled]:nth-child(3)";
  #
  # // searchWrenchBtn="#job-jobID > div:nth-child(1) > div:nth-child(3) > a:nth-child(2) > i:nth-child(1)";
  # */
  def self.addStylesToEventBtn
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(5)"
  end

  def self.addStylesToEventBtnDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > .btn-success[disabled]:nth-child(5)"
  end

  def self.viewSizesAndColorsBtn
    $method = __method__
    return "#collapsejobID > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(2)"
  end

  def self.viewSizesAndColorsBtnDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > .btn-link[disabled]:nth-child(2)"
  end

  def self.exportBtn
    $method = __method__
    return "#collapsejobID > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > a:nth-child(2)"
  end

  def self.exportBtnDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(1) > div:nth-child(1)  > div:nth-child(1) > .btn-link[disabled]:nth-child(2)"
  end

  def self.reviewNewStyles
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(2)"
  end

  def self.reviewNewStyleNumbersDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > .btn-success[disabled]:nth-child(2)"
  end

  def self.reviewNewSkus
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > a:nth-child(1)"
  end

  def self.reviewNewSkusBtnDisabled
    $method = __method__
    return "#collapsejobID > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > .btn-success[disabled]:nth-child(1)"
  end

  def self.deleteStylesBtn
    $method = __method__
    return "#job-jobID > div:nth-child(1) > div:nth-child(3) > a:nth-child(1) > i:nth-child(1)"
  end

  def self.styleRows
    $method = __method__
    return "tr.job-jobID-styles"
  end

  def self.styleRow
    $method = __method__
    return "tr.job-jobID-styles:nth-child(1)"
  end

  def self.greenRowsOnStylesGrid
    $method = __method__
    return "tr.job-jobID-styles.success"
  end

  def self.redRowsOnStylesGrid
    $method = __method__
    return "tr.job-jobID-styles.danger"
  end

  def self.yellowRowsOnStylesGrid
    $method = __method__
    return "tr.job-jobID-styles.warning"
  end

  def self.blueRowsOnStylesGrid
    $method = __method__
    return "tr.job-jobID-styles.info"
  end

  def self.brand
    $method = __method__
    return "> td:nth-child(1)"
  end

  def self.styleNum
    $method = __method__
    return " > td:nth-child(2)"
  end

  def self.styleName
    $method = __method__
    return " > td:nth-child(3)"
  end

  def self.status
    $method = __method__
    return " > td:nth-child(4)"
  end

  def self.newSkus
    $method = __method__
    return " > td:nth-child(5)"
  end

  def self.existingSkus
    $method = __method__
    return " > td:nth-child(6)"
  end

  def self.editStyleBtn
    $method = __method__
    return " > td:nth-child(7) > a:nth-child(1)"
  end


  def self.deleteStyleInJobBtn
    $method = __method__
    return " > td:nth-child(7) > a:nth-child(2)"
  end

  def self.editStylesBtnByStyleNum
    $method = __method__
    return "//table[@id='styles-jobID']/tbody/tr/td[2][contains(text(),'styleNum')]"
  end

  def self.getCountOfColoredRows
    $method = __method__
    # /*if (jobID == null)
    #     jobID=getJobID(1);*/
    $countOfGreenRows =0
    $countOfRedRows =0
    $countOfYellowRows =0
    $countOfBlueRows =0
    # //stylesGrid.getStyleGridElements(stylesGrid.greenRowsOnStylesGrid).size()

    for styleRow in getStyleGridElements(styleRows)
      color = styleRow.class_name
      if (color.include? 'success') then
        $countOfGreenRows+=1
      elsif (color.include? 'danger') then
        $countOfRedRows+=1
      elsif (color.include? 'warning') then
        $countOfYellowRows+=1
      elsif (color.include? 'info')
        $countOfBlueRows+=1
      end
    end
  end

  def self.getStyleGridElement(webelementPath)
    $method = __method__
    #puts "inside"
#  $job_id=Stylesgridpageobject.getJobId
#  /*if (jobID == null)
#      jobID=getJobID(1);*/
    cssOfJob=webelementPath.gsub("jobID", "#{$job_id}")
    #puts cssOfJob
    styleGridElement=$browser.element(:css => "#{cssOfJob}")
    return styleGridElement
  end

  def self.getStyleGridElements(webelementPath)
    $method = __method__
    # /*if (jobID == null) then
    #     jobID=getJobID(1);*/
    cssOfJob=webelementPath.gsub("jobID", "#{$job_id}")
    # puts cssOfJob
    styleGridElement= $browser.elements(:css => "#{cssOfJob}")
    #puts styleGridElement.size
    return styleGridElement

  end

  def self.statusOfStyle(styleRowNumber)
    $method = __method__
    #puts "you are in statusOfStyle "
    return getStyleField(Stylesgridpageobject.status, styleRowNumber)

  end

  def self.getStyleField(field, styleRowNumber)
    $method = __method__
   # puts "you are in getStyleField"
    #  /*if (jobID == null)
    #      jobID=getJobID(1);*/
    cssSelectorForStyleField=styleRow.gsub("(1)", "(#{styleRowNumber})")
    cssSelectorForStyleField = "#{cssSelectorForStyleField}#{field}"
    styleField = getStyleGridElement(cssSelectorForStyleField).text
    return styleField
  end

  #  // This method returns the new Sku Count Of a Style that is in the given row in a particular job(for now the first job)
  def self.newSkuCountOfStyle(styleRowNumber)
    $method = __method__
    return (getStyleField(Stylesgridpageobject.newSkus, styleRowNumber)).to_i
  end

  def self.existingSkuCountOfStyle(styleRowNumber)
    $method = __method__
    return (getStyleField(Stylesgridpageobject.existingSkus, styleRowNumber)).to_i
  end

  def self.editStylesBtn(styleRowNumber)
   # puts "inside editStylesBtn"
    $method = __method__
    #  /*if (jobID == null)
    #      jobID=getJobID(1);*/
    cssSelectorForEditStylesBtn=styleRow.gsub("(1)", "(#{styleRowNumber})")
    #puts cssSelectorForEditStylesBtn
   # puts "Hello1 "
    edit_buttton =Stylesgridpageobject.editStyleBtn
    #puts "#{edit_buttton}"
    cssSelectorForEditStylesBtn ="#{cssSelectorForEditStylesBtn}#{edit_buttton}"
    #puts cssSelectorForEditStylesBtn
   # puts cssSelectorForEditStylesBtn
    return getStyleGridElement(cssSelectorForEditStylesBtn)
  end
end
