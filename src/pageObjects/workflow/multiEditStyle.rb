class MutltiEdit
  def self.selectMultipleStyles(number_of_styles)
    $method = __method__
    #puts number_of_styles
    Grid.gridroot
    total_results=Grid.getRows_all.size
   # puts total_results
    styleIdArray=Array.new
    i=0
    if (number_of_styles<=total_results)
      for i in 1..number_of_styles
        $browser.tr(:index,i).click(:command)
       # puts $browser.tr(:index,i).attribute_value("data-style-id")
        styleIdArray.push( $browser.tr(:index,i).attribute_value("data-style-id"))
      end
    end
return styleIdArray
  end
  def self.updateSelected
    return $browser.button(:text,"Update Selected")
  end
  def self.newBrandName(newName)
    $browser.element(:xpath,"//input[@id='workflow_styles_batch_edit_brand']").send_keys"#{newName}"
  end
  def self.saveButton
    return $browser.button(:text,"Save")
  end
  def self.closeButton
    return $browser.button(:text ,"Close")
  end
  def self.acceptAlert
    return $browser.alert.ok
  end

end