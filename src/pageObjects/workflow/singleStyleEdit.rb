class SingleStyleEdit
#buttons
  def self.addStyleBtn
    $method = __method__
    return $browser.elemets(:css => ".btn-primary")
  end

  def self.createInEcomBtn
    $method = __method__
    return $browser.button(:id => "workflow_style_create_in_ecom")
  end

  def self.createInEcomBtnEnabled
    $method = __method__
    return $browser.button(:xpath => "//form/div/div[3]/button[2]")
  end

  def self.createInEcomBtnDisabled
    $method = __method__
    return $browser.button(:xpath => "//form/div/div[3]/button[2][@disabled='disabled']")
  end

  def self.remove
    $method = __method__
    return $browser.element(:css => "button.btn.btn-danger")
  end

  def self.createStyleBtn
    $method = __method__
    return $browser.button(:xpath => "//button[@type='submit']")
  end

  def self.addSkuBtn
    $method = __method__
    return $browser.element(:css => "#add-sku")
  end

# def self.fixBizClassBtn
# return $browser.
#    @FindBy(linkText = "Fix Business Classification")
#    public WebElement fixBizClassBtn;
  def self.validateBizClassBtn
    $method = __method__
    return $browser.button(:text => "Validate")
  end

  def self.EditBizClassBtn
    $method = __method__
    return $browser.a(:text => "Edit Business Classification")
  end

  def self.ValidateBtn
    $method = __method__
    return $browser.button(:text => "Validate")
  end

  def self.previousBtn
    $method = __method__
    return $browser.element(:css => "i.fa.fa-arrow-left")
  end

  def self.previousBtnDisabled
    $method = __method__
    return $browser.element(:css => "div#secondary-nav ul.nav li.disabled:nth-child(1)")
  end

  def self.nextBtn
    $method = __method__
    return $browser.element(:css => ".fa-arrow-right")
  end

  def self.nextBtnDisabled
    $method = __method__
    return $browser.element(:css => "div#secondary-nav ul.nav li.disabled:nth-child(2)")
  end

  def self.editor_elements(label_name)
    $method = __method__
    edit_parent = $browser.label(:text => "#{label_name}").parent
    if (label_name=="Brand Name")
      return edit_parent.text_field(:index => 1)
    elsif (label_name=="Season")
      return edit_parent.select_list
    else
      edit_parent.text_field

    end
  end

  def self.editor_elements_drop_down(label_name)
    $method = __method__
    edit_parent = $browser.label(:text => "#{label_name}").parent
    return edit_parent.select_list
  end

  def self.getStyle
    $method = __method__
    #this.isAjaxCompleted();
    #Map<String, String> map=new HashMap<String,String>();
    map=Hash.new
    map["brand"]=editor_elements("Brand Name").value
    map["styleNumber"]= editor_elements("Style Number").value
    map["styleName"]=editor_elements("Style Name").value
    map["groupNumber"]=editor_elements("Group Number").value #get this group number to decide the clearance date at sku level
    #map.put("style_group_id", this.groupNumber.getAttribute("value"));
    map["country"]=editor_elements("Country").value
    map["weight"] =editor_elements("Weight").value
    map["season"]=editor_elements("Season").selected_options.map(&:text).join
    map["status"]="100"
    #=season.tr(']','')
    #map.put("status", "100");//for new style default style status is 100
   # puts map
    return map
  end

  def self.getGrid
    #this.isAjaxCompleted();
    #Grid.gridroot(Dashboard.table)
    Grid.gridroot
    #Grid grid=new Grid(header.table);
    #List<Map<String, String>> list = new ArrayList<Map<String, String>>();
    #HashMap<String, String> hs1;
    # rows=Array.new
   # puts "1"
    rows=[]
    rows=Grid.getRows("success")
    row=rows.size
    #puts rows.size
    #row=Grid.getRows("success").size
    # puts "2"
    # puts rows
    # row =rows.size
    #  puts "number of rows"+row
    # puts "number of successfuul rows #{row}"
    list=Array.new
    # hs1=Hash.new

    while (row>0) do
      hs1=Hash.new
      hs1["Size"]=Grid.getCell_web_string(rows[row-1], "Size").element(:tag_name => "input").value
      hs1["Color"]=Grid.getCell_web_string(rows[row-1], "Color").element(:tag_name => "input").value
      hs1["UPC"]=Grid.getCell_web_string(rows[row-1], "UPC").element(:tag_name => "input").value
      hs1["Nordstrom UPC"]=Grid.getCell_web_string(rows[row-1], "Nordstrom UPC").element(:tag_name => "input").value
      hs1["Quantity"]=Grid.getCell_web_string(rows[row-1], "Quantity").element(:tag_name => "input").value
      hs1["MSRP"]=Grid.getCell_web_string(rows[row-1], "MSRP").element(:tag_name => "input").value
      hs1["Price"]=Grid.getCell_web_string(rows[row-1], "Price").element(:tag_name => "input").value
      #hs1.put["Color Family"]=new Select(grid.getCell(rows.get(row-1), "Color Family").findElement(By.tagName("select"))).getFirstSelectedOption().getText());
      list.push(hs1)
      row=row-1
    end
    #puts list
    return list
  end
end
