class ShopsNewPage

  def self.selectSomeTextField(label)
    $method = __method__
    input_field_parent = $browser.label(:text => "#{label}").parent
    #puts input_field_parent.text_field.visible?
    return input_field_parent.text_field
  end
  def self.date(date_type)
    $method = __method__
    #puts $browser.element(:xpath,"//input[contains(@id,'#{date_type}')]")
   return $browser.element(:xpath,"//input[contains(@id,'#{date_type}')]")
  end
  def self.visibleInNavigation
    return $browser.element(:xpath,"//input[@type='checkbox' and @id='workflow_shop_visibleInNavigation']")
  end
  def self.saveButton
    return $browser.button(:text,"Save")
  end
  def self.cancel
    return $browser.a(:text,"Cancel")
  end
  def self.validationErrorMessage
    return $browser.span(:class,"help-block has-error")
  end
  def self.validationErrorMessage1(id,message)
    $method = __method__
    input_field_parent = $browser.text_field(:id,"#{id}").parent
    div_error=input_field_parent.div(:class,"has-error")
   # puts div_error.visible?
  #puts div_error.span(:class,"help-block has-error").visible?
    return div_error.span(:class,"help-block has-error")
  end
end