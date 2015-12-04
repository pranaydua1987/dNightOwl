class ShopsStylesPageobject

  def self.successfulMessage(message)
    $method = __method__
    $browser.div(:text,"#{message}")
  end
  def self.searchStyleButton
    $method = __method__
    $browser.a(:text,"Search Styles")
  end
  def self.selectStyle(style_id)
    $method = __method__
    return $browser.element(:xpath,"//input[@type='checkbox' and @value='#{style_id}']")
  end
  def self.selectMultipleStyles(style_id)
    $method = __method__
    style_id.each do |style_id|
     $browser.element(:xpath,"//input[@type='checkbox' and @value='#{style_id}']").click
      end
  end
  def self.addStyletoShop
    $method = __method__
    return $browser.button(:text,"Add Styles to Shop")
  end
  def self.checkStylesShopTable(style_array)
    $method = __method__
    puts style_array
    puts "-------"
    coloumn=Array.new
    coloumn=PopupModel.table_columns("shops-styles-table","Style ID")
    coloumn=coloumn.delete_at(0)
    puts coloumn

    puts coloumn.include?style_array
   #
   return coloumn.include?style_array
  end
  def self.deleteStyleId(style_id)
    $method = __method__

   return $browser.element(:xpath,"//tr[@data-style-id='#{style_id}']/td/a[@href='#deleteShopStyleConfirmModal']")
    # return $browser.button(:text,"Add Styles to Shop")
  end
  def self.removeStyleButton
    $method = __method__

    return $browser.button(:text,"Remove Style")
    # return $browser.button(:text,"Add Styles to Shop")
  end
  def self.shopParameters
    $method = __method__
    parameters=Hash.new
    div_field_parent = $browser.label(:text => "Shop ID").parent
   # puts div_field_parent.div.visible?
    #puts div_field_parent.div.text
   # $browser.a(:text,"Search Styles")
    parameters["id"]=div_field_parent.div.text
    parameters["shop_name"]=$browser.element(:xpath ,"//input[@id='workflow_shop_shopName']").attribute_value('value')
    parameters["start_date"]=$browser.element(:xpath ,"//input[@id='workflow_shop_startDate']").attribute_value('value')+" 00:00:00"
    parameters["end_date"]=$browser.element(:xpath ,"//input[@id='workflow_shop_endDate']").attribute_value('value')+" 00:00:00"

    parameters["visible"]=$browser.element(:xpath ,"//input[@type='checkbox' and @id='workflow_shop_visibleInNavigation']").attribute_value('value')

    #puts parameters
    return parameters
  end
end