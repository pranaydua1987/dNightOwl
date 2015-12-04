class SearchStylesPageObject
  def self.searchInputField
    $method = __method__
    return $browser.text_field(:id => "query-tokenfield")
  end

  def self.searchSelector(value)
    $method = __method__
    #puts value

    $browser.select_list(:id => "field").select value
    # b.select_list(:id => "field").select "Style ID"

  end

  def self.searchButton
    $method = __method__
    return $browser.button(:text => "Search")
  end

  def self.errorMessage
    $method = __method__
    return $browser.div(:class => "alert alert-danger")
  end

  def self.clearButton
    $method = __method__
    return $browser.button(:text => "Clear")
  end
  def self.removeSearchedBrand(brandName)
    parentBrand=$browser.span(:text,"#{brandName}").parent
    deleteButton=parentBrand.a(:class,"close")
    return deleteButton
  end
  def self.actionButton(button_type)
    $method = __method__
    #puts "//a[contains(text(),#{button_type})]"
    return $browser.elements(:xpath => "//a[contains(@class,'btn-primary') and contains(text(),\"#{button_type}\")]")
  end

  def self.exportButton
    $method = __method__
#  puts "//a[contains(text(),#{button_type})]"
    return $browser.element(:xpath => "//i[@class='fa fa-wrench']")
  end

  def self.exportLink
    $method = __method__
    #text="//a[contains(text(),\"Export to .xls\")]"
    # puts "//a[contains(text(),#{button_type})]"
    #puts "//a[contains(text(),\"Export to .xls\")]"
    return $browser.element(:xpath => "//a[contains(@href,'/search/export')]")
  end

  def self.enableMultiEdit
    $method = __method__
    return $browser.a(:text => "Enable Multi Edit")
  end
  def self.disableMultiEdit
    $method = __method__
    return $browser.a(:text => "Disable Multi Edit")
  end
  def self.handleAlert
    $method = __method__
    #puts $browser.alert.exists?
    #puts $browser.alert.text
    $browser.alert.ok
    #return $browser.a(:text =>"Enable Multi Edit")
  end

  def self.search(parameter, query)
    $method = __method__
    SearchStylesPageObject.searchSelector(parameter)
    SearchStylesPageObject.searchInputField.send_keys(query)
    SearchStylesPageObject.searchButton.click
    sleep 3
  end
  def self.multipleSearch(parameter, query)
    $method = __method__
    SearchStylesPageObject.searchSelector(parameter)
    #puts query.size
    query.each do |query|
    SearchStylesPageObject.searchInputField.send_keys("#{query}")
    $browser.send_keys :tab
    end
    SearchStylesPageObject.searchButton.click
    sleep 3
  end
end
