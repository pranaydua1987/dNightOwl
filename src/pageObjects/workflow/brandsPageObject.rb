class BrandsPageObject

  # def self.brandDetails(brandFieldName)
  #   parent_brand_field=$browser.span(:text,"#{brandFieldName}").parent
  #   #puts parent_brand_field
  #   sibling=parent_brand_field.li(:xpath => './following-sibling::li[1]')
  #   checkedRadioButton=sibling.div.input(:checked,"checked")
  #  return checkedRadioButton.value
  # end
  def self.brandDetails(brandFieldName)
    $method = __method__
    parent_brand_field=$browser.label(:text,"#{brandFieldName}").parent
    #puts parent_brand_field
    brandDetailCheckbox=parent_brand_field.checkbox
    # checkedRadioButton=sibling.div.input(:checked,"checked")
    return brandDetailCheckbox
  end
def self.brandHeading(header)
  $method = __method__
  return $browser.h2(:text,"#{header}")
end
def self.selectBrandDetailsRadioButton(brandFieldName,value)
  $method = __method__
  parent_brand_field=$browser.span(:text,"#{brandFieldName}").parent
  #puts parent_brand_field
  sibling=parent_brand_field.li(:xpath => './following-sibling::li[1]')
  checkedRadioButton=sibling.div.input(:value,"#{value}")
end
  def self.selectSaveButton(brandFormName)
    $method = __method__
    saveButton=$browser.button(:xpath,"//form[contains(@name,'#{brandFormName}')]/div/button[contains(text(),\"Save Changes\")]")
    # #puts parent_brand_field
    # sibling=parent_brand_field.li(:xpath => './following-sibling::li[1]')
    # checkedRadioButton=sibling.div.input(:value,"#{value}")
    return saveButton
  end
  def self.addStyleButton
    $method = __method__

    return $browser.a(:title,"Add Styles")
  end
  def self.addStyleCustomerChoices
    $method = __method__

    return $browser.button(:text,"Add Styles")
  end
  def self.selectCustomerChoices(style_id)
    $method = __method__
    puts $browser.element(:xpath,"//tr[@id='tr#{style_id}']/td[4]/span/span/span/ul").present?
    selectionField=$browser.element(:xpath,"//tr[@id='tr#{style_id}']/td[4]/span/span/span/ul")
    selectionField.click
    sleep 1
   puts  selectionField.li.present?
    selectionField.li.click
    $browser.send_keys :enter

  end
  def self.deleteCustomerChoices(style_id)
    $method = __method__
    puts $browser.element(:xpath,"//tr[@id='tr#{style_id}']/td[5]/a[@title='Delete Style']").present?
    $browser.element(:xpath,"//tr[@id='tr#{style_id}']/td[5]/a[@title='Delete Style']").click
    sleep 2
    $browser.button(:text,"Yes, Remove").click
    sleep 5
   puts  $browser.div(:text,"Operation successful. Customer choice exception removed.").present?
    assert_equal($browser.div(:text,"Operation successful. Customer choice exception removed.").present?.to_s,"true".to_s,"customer Choice successfull deletion message missing")


  end
  def self.selectSaveButtonDiv(brandDivisionName)
    $method = __method__
    saveButton=$browser.button(:xpath,"//div[contains(@id,'#{brandDivisionName}')]/div/button[contains(text(),\"Save Changes\")]")
    # #puts parent_brand_field
    # sibling=parent_brand_field.li(:xpath => './following-sibling::li[1]')
    # checkedRadioButton=sibling.div.input(:value,"#{value}")
    return saveButton
  end
  def self.businessClassificationDropDown(businessClassificationName)
    $method = __method__

    divisionParent = $browser.h2(:text => "Business Classification Exceptions for Persistent").parent.parent

    $browser.scroll.to divisionParent

    liRow = divisionParent.a(:text,"#{businessClassificationName}").parent
    # #puts parent_brand_field
    # sibling=parent_brand_field.li(:xpath => './following-sibling::li[1]')
    # checkedRadioButton=sibling.div.input(:value,"#{value}")
    #  liRow.i(:class,"jstree-icon jstree-ocl").click
    return liRow.i(:class,"jstree-icon jstree-ocl")
  end
  def self.businessClassificationCheckBox(businessClassificationName)
    $method = __method__
    liRow=$browser.a(:text,"#{businessClassificationName}")
    puts liRow.visible?
    # #puts parent_brand_field
    # sibling=parent_brand_field.li(:xpath => './following-sibling::li[1]')
    # checkedRadioButton=sibling.div.input(:value,"#{value}")
    return liRow.i(:class,"jstree-icon jstree-checkbox")
  end
end